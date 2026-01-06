using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using CNet.BLL.Main;
using CNet.Common;
using Microsoft.AspNetCore.Identity;
using CNet.Model.Main;
using Lazy.SlideCaptcha.Core.Validator;
using Lazy.SlideCaptcha.Core;
using Newtonsoft.Json;
using static Lazy.SlideCaptcha.Core.ValidateResult;
using Microsoft.AspNetCore.Routing;
using NPOI.SS.Formula.Functions;
using log4net.Config;
using CNet.Model;
using static CNet.Web.Api.Controllers.PubFunctionController;

namespace CNet.Web.Api.Controllers
{
	/// <summary>
	/// 认证
	/// </summary>
	[ApiExplorerSettings(GroupName = "Admin")]
	[Route("api/Authroize")]
	public class AuthroizeController: Controller
	{
        private readonly JwtSeetings _jwtSeetings;
		private ICaptcha _captcha;

		public AuthroizeController(IOptions<JwtSeetings> jwtSeetingsOptions, ICaptcha captcha)
        {
            _jwtSeetings = jwtSeetingsOptions.Value;
			_captcha = captcha;
		}
		public bool IsCaptchaValida { get; } = false;

		/// <summary>
		/// 登录获取token
		/// </summary>
		/// <param name="loginViewModel">登录实体信息</param>
		/// <returns></returns>
		[HttpPost,AllowAnonymous]
        public dynamic Post([FromBody]LoginViewModel loginViewModel)
        {


			//if (!ModelState.IsValid)
			//{
			//    return BadRequest();
			//}

			#region 验证码校验

			if (IsCaptchaValida)
			{
				if (string.IsNullOrEmpty(loginViewModel.CaptchaId))
				{
					throw ResultOutput.Exception("请完成安全验证");
				}
				var validateResult = _captcha.Validate(loginViewModel.CaptchaId, JsonConvert.DeserializeObject<SlideTrack>(loginViewModel.CaptchaData));
				if (validateResult.Result != ValidateResultType.Success)
				{
					throw ResultOutput.Exception($"安全{validateResult.Message}，请重新登录");
				}
			}
		

			#endregion
			loginViewModel.UserName = QueryHelper.InjectionFilter(loginViewModel.UserName);
			loginViewModel.Password = QueryHelper.InjectionFilter(loginViewModel.Password);

			var users = new Pub_UserBLL().GetList($"StopFlag=0 AND UserStatus=1 AND UserName='{loginViewModel.UserName}' AND UserPwd='{loginViewModel.Password}'", limits: 1);

			if (users.Count > 0)
			{
				var user = users.First();
				var claims = new Claim[]
				{
					new Claim(ClaimTypes.Name,user.UserName),
					new Claim("Id",user.Id.ToString()),
					new Claim("UserCode",user.UserCode),
					new Claim("Tel",user.Tel??""),
					new Claim("DeptCode",user.DeptCode??"")
				};
				var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSeetings.SecretKey));
				var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

				var expires = DateTime.Now.AddMinutes(240);
				var tokenObj = new JwtSecurityToken(
					_jwtSeetings.Issuer,
					_jwtSeetings.Audience,
					claims,
					DateTime.Now,
				   expires,
					creds
					);

				var token = new JwtSecurityTokenHandler().WriteToken(tokenObj);
                //return new { token };
                return ResultOutput.Ok(new { token});
            }

			throw ResultOutput.Exception("用户名或密码错误！");
			//return BadRequest();
		}

		/// <summary>
		/// 是否开启验证码
		/// </summary>
		/// <returns></returns>
		[HttpGet,AllowAnonymous]
		[Route("isCaptcha")]
		public IResultOutput<bool> IsCaptcha()
		{
			return ResultOutput.Ok(IsCaptchaValida);
		}



		/// <summary>
		/// 获取菜单
		/// </summary>
		/// <returns></returns>
		[Route("GetUserMenu")]
		[HttpPost,Authorize]
		//[AllowAnonymous]//添加这个属性后获取不到User
		public IResultOutput<List<Pub_Function>> GetMenu()
		{
			List<Pub_Function> functions =new Pub_FunctionBLL().GetMenu(User.GetCNetUser().UserCode);

			return ResultOutput.Ok(functions);
		}

		/// <summary>
		/// 获取菜单
		/// </summary>
		/// <returns></returns>
		[Route("GetUserAccess")]
		[HttpPost, Authorize]
		//[AllowAnonymous]//添加这个属性后获取不到User
		public dynamic GetUserAccess()
		{
			var user = new CNetUser(User);
			var userName = user.UserName;
			var userCode = user.UserCode;
			var access = user.Access;

			return ResultOutput.Ok(
			new
			{
				user =new {
					userName =userName,
					userCode = userCode,
					avatar = ""
				},
				permissions=access
			}
			);
		}
	}
}