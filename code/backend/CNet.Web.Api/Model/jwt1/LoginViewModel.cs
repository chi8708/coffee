using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CNet.Web.Api
{

    public class LoginViewModel
    {
		////[Required]
		///// <summary>
		///// 用户名
		///// </summary>
		//public string Name { get; set; }

		////[Required]
		///// <summary>
		///// 密码
		///// </summary>
		//public string Password { get; set; }

		/// <summary>
		/// 账号
		/// </summary>
		public string UserName { get; set; }

		/// <summary>
		/// 密码
		/// </summary>
		public string Password { get; set; }

		/// <summary>
		/// 密码键
		/// </summary>
		public string PasswordKey { get; set; }

		/// <summary>
		/// 验证码Id
		/// </summary>
		public string CaptchaId { get; set; }

		/// <summary>
		/// 验证码数据
		/// </summary>
		public string CaptchaData { get; set; }

	}
}
