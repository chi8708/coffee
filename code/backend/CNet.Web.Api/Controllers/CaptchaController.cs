using Lazy.SlideCaptcha.Core.Validator;
using Lazy.SlideCaptcha.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using CNet.Web.Api.Core.Captcha;

namespace CNet.Web.Api.Controllers
{
	[ApiExplorerSettings(GroupName = "Admin")]
	[Route("api/admin/[controller]")]
	[ApiController,NonFormatResult]
	public class CaptchaController : BaseController
	{
		private readonly ICaptcha _captcha;
		private ISlideCaptcha _slideCaptcha;
		public CaptchaController(ICaptcha captcha, ISlideCaptcha slideCaptcha) 
		{
			_captcha = captcha;
			_slideCaptcha = slideCaptcha;
		}


		/// <summary>
		/// 生成
		/// </summary>
		/// <param name="captchaId">验证码id</param>
		/// <returns></returns>
		[HttpPost, AllowAnonymous]
		[Route("generate")]
		public IResultOutput<CaptchaData> Generate(string captchaId = null)
		{
			var data = _captcha.Generate(captchaId);
			return ResultOutput.Ok(data);
		}

		/// <summary>
		/// 验证
		/// </summary>
		/// <param name="captchaId">验证码id</param>
		/// <param name="track">滑动轨迹</param>
		/// <returns></returns>
		[HttpPost, AllowAnonymous]
		[Route("check")]
		public IResultOutput<ValidateResult> Check([FromQuery] string captchaId, SlideTrack track)
		{
			if (string.IsNullOrWhiteSpace(captchaId))
			{
				throw ResultOutput.Exception("请完成安全验证");
			}

			var data = _slideCaptcha.Validate(captchaId, track, false);
			return  ResultOutput.Ok(data);
		}
	}
}
