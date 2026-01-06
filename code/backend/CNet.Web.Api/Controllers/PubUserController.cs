using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using CNet.Model.Main;
using CNet.BLL.Main;
using CNet.Model;
using System.Data.SqlClient;
using Newtonsoft.Json;
using Dapper;

namespace CNet.Web.Api.Controllers
{
    [ApiExplorerSettings(GroupName = "Admin")]
    /// <summary>
    /// 用户管理
    /// </summary>
    [Produces("application/json")]
    [Authorize]
    [Route("api/PubUser")]
    public class PubUserController : BaseController
    {
        private Pub_UserBLL bll = new Pub_UserBLL();
        private V_Pubuser_DeptBLL userDeptBLL = new V_Pubuser_DeptBLL();
        private Pub_UserroleBLL userRoleBLL = new Pub_UserroleBLL();
        private Pub_RoleBLL roleBLL = new Pub_RoleBLL();
        Pub_UserfunctionBLL userFunctionBLL = new Pub_UserfunctionBLL();

        [HttpGet, Route("GetAccess")]
        public dynamic GetAccess()
        {
            // var userCode = User.Identity.Name;

            //var c = (a:1,b:2);
            //return (
            //    access: new List<string>() { "super_admin", "admin" },
            //    avatar: "https://file.iviewui.com/dist/a0e88e83800f138b94d2414621bd9704.png",
            //    name: "super_admin",
            //    user_id:"1"
            //    );
            var user = new CNetUser(User);
            var userName = user.UserName;
            var userCode = user.UserCode;
            var access = user.Access;
            return new
            {
                access = access,
                avatar = "https://file.iviewui.com/dist/a0e88e83800f138b94d2414621bd9704.png",
                name = userName,
                user_id = userCode
            };
        }

        /// <summary>
        /// 获取用户分页1
        /// </summary>
        /// <returns></returns>
        [Route("GetPage")]
        [HttpPost]
        public PageDateRes<V_Pubuser_Dept> GetPage([FromBody] PageDataReq pageReq)
        {
            var whereStr = GetWhereStr(pageReq);
            if (whereStr == "-1")
            {
                return new PageDateRes<V_Pubuser_Dept>() { code = ResCode.Error, msg = "查询参数有误！", data = null };
            }
            var users = userDeptBLL.GetPage(whereStr, (pageReq.field + " " + pageReq.order), pageReq.pageNum, pageReq.pageSize);

            //  PageDateRes<V_Pubuser_DeptExt> users = usersPage.MapTo<PageDateRes <V_Pubuser_Dept>,PageDateRes <V_Pubuser_DeptExt>>();
            var userCodes = string.Join("','", users.data.Select(p => p.UserCode));
            List<Pub_Userrole> userRoles = userRoleBLL.GetList($"userCode in ('{userCodes}')");

            var roleCdoes = string.Join("','", userRoles.Select(p => p.RoleCode));
            List<Pub_Role> roles = roleBLL.GetList($"roleCode in ('{roleCdoes}')");
            users.data.ForEach(p =>
            {
                p.RoleCodes = userRoles.Where(c => c.UserCode == p.UserCode).Select(d => d.RoleCode);
                p.RoleNames = roles.Where(c => p.RoleCodes.Contains(c.RoleCode)).Select(d => d.RoleName);
            });

            return users;
        }

        private string GetWhereStr(PageDataReq pageReq)
        {
            StringBuilder sb = new StringBuilder(" 1=1 ");
            sb.Append(" and StopFlag=0 ");
            var query = this.HttpContext.GetWhereStr();
            if (query == "-1")
            {
                return query;
            }
            sb.AppendFormat(" and {0} ", query);
            if (pageReq.query.ContainsKey("S_deptCode") && !string.IsNullOrWhiteSpace(pageReq.query["S_deptCode"]?.ToString()))
            {
                sb.AppendFormat(@" and  DeptCode IN (
                                with RECURSIVE f as 
	                            (
	                            select * FROM Pub_Department AS pd where DeptCode='{0}'
	                            union all
	                            select a.* from Pub_Department as a inner join f on a.ParentCode=f.DeptCode
	                            )
	                           SELECT f.DeptCode FROM  f 
                             ) ", pageReq.query["S_deptCode"]);
            }

            return sb.ToString();
        }


        /// <summary>
        /// 添加用户
        /// </summary>
        /// <returns></returns>
        [Route("Add")]
        [HttpPost]
        public DataRes<bool> Add([FromBody] V_Pubuser_Dept model)
        {
            DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            var oldUser = bll.GetUserByUserName(model.UserName);
            if (oldUser != null)
            {
                res.code = ResCode.NoValidate;
                res.data = false;
                res.msg = "用户名已存在，请修改！";
                return res;
            }

            model.Crdt = model.Lmdt = DateTime.Now;
            var user = new CNetUser(User);
            model.Crid = model.Lmid = $"{user.UserCode}-{user.UserName}";
            model.UserStatus = 1;
            var r = bll.Add(model);
            if (!r.Item1)
            {
                res.code = ResCode.Error;
                res.data = false;
                res.msg = r.Item2;
            }

            return res;
        }

        /// <summary>
        /// 编辑用户
        /// </summary>
        /// <returns></returns>
        [Route("Edit")]
        [HttpPost]
        public DataRes<bool> Edit([FromBody] V_Pubuser_Dept model)
        {
            DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            var oldUser = bll.GetUserByUserName(model.UserName);
            if (oldUser != null && oldUser.Id != model.Id)
            {
                res.code = ResCode.NoValidate;
                res.data = false;
                res.msg = "用户名已存在，请修改！";
                return res;
            }

            model.Lmdt = DateTime.Now;
            var user = new CNetUser(User);
            model.Lmid = $"{user.UserCode}-{user.UserName}";
            var r = bll.Edit(model);
            if (!r.Item1)
            {
                res.code = ResCode.Error;
                res.data = false;
                res.msg = r.Item2;
            }

            return res;
        }

        /// <summary>
        /// 删除用户
        /// </summary>
        /// <returns></returns>
        [Route("Delete/{id}")]
        [HttpPost]
        public DataRes<bool> Delete(long id)
        {
            DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            var r = bll.ChangeSotpStatus($"id={id}", null);
            if (!r)
            {
                res.code = ResCode.Error;
                res.data = false;
                res.msg = "删除失败";
            }

            return res;
        }


        /// <summary>
        /// 获取用户权限
        /// </summary>
        /// <returns></returns>
        [Route("GetFunctions/{code}")]
        [HttpPost]
        public DataRes<IEnumerable<string>> GetFunctions(string code)
        {
            DataRes<IEnumerable<string>> res = new DataRes<IEnumerable<string>>() { code = ResCode.Success };

            var list = userFunctionBLL.GetList($"userCode='{code}'");
            res.data = list.Select(p => p.FunctionCode);

            return res;
        }

        /// <summary>
        /// 保存用户权限
        /// </summary>
        /// <returns></returns>
        [Route("SaveFunctions/{code}")]
        [HttpPost]
        public DataRes<bool> SaveFunctions(string code, [FromBody] List<string> functions)
        {
            DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            List<Pub_Userfunction> list = new List<Pub_Userfunction>();
            functions.ForEach(p => { list.Add(new Pub_Userfunction() { FunctionCode = p, UserCode = code }); });
            var r = bll.SaveFunctions(code, list);
            if (!r.Item1)
            {
                res.code = ResCode.Error;
                res.data = false;
                res.msg = "保存失败";
            }

            return res;
        }

        /// <summary>
        /// 注销登录
        /// </summary>
        /// <returns></returns>

        [HttpPost, Route("Logout")]
        public dynamic Logout()
        {
            //User = null;
            DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            return res;
        }


        /// <summary>
        /// 获取用户实体
        /// </summary>
        /// <returns></returns>
        [Route("GetModel/{id}")]
        [HttpPost]
        public DataRes<V_Pubuser_Dept> GetModel(long id)
        {
            DataRes<V_Pubuser_Dept> res = new DataRes<V_Pubuser_Dept>() { code = ResCode.Success, data = null };
            var model = userDeptBLL.Get(id, "id");
            List<Pub_Userrole> userRoles = userRoleBLL.GetList($"userCode ='{model.UserCode}'");
            model.RoleCodes = userRoles.Select(d => d.RoleCode);
            res.data = model;
            return res;
        }

        /// <summary>
        /// 启用 停用
        /// </summary>
        /// <returns></returns>
        [Route("ChangeUserStatus")]
        [HttpPost]
		//不添加[FromForm]也可以， 默认为[FromForm]
		public DataRes<bool> ChangeUserStatus([FromForm] long id, [FromForm]int userStatus)
        {
            DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            var r = bll.UpdateFiled($"UserStatus=@userStatus", $"id={id}", new { @userStatus=userStatus });
            if (!r)
            {
                res.code = ResCode.Error;
                res.data = false;
                res.msg = "保存失败";
            }

            return res;
        }

		/// <summary>
		///重置密码
		/// </summary>
		/// <returns></returns>
		[Route("ResetPassWord")]
		[HttpPost]
		public DataRes<bool> ResetPassWord([FromBody]dynamic request)
		{
			DataRes<bool> res = new DataRes<bool>() { code = ResCode.Success, data = true };

            var passWord = Convert.ToString(request.passWord);
            var id = Convert.ToInt32(request.id);
			passWord = string.IsNullOrWhiteSpace(passWord) ? "111111" : passWord;
            //不能将request 直接传入 需要将每个字段类型转换，再通过dynamicParams 或new{}传入。
            //var dynamicParams = new DynamicParameters();
            //dynamicParams.Add("id", id);
            //dynamicParams.Add("passWord", passWord);

            var r = bll.UpdateFiled($"UserPwd=@passWord", "id=@id"
                , new { id, passWord });
			if (!r)
			{
				res.code = ResCode.Error;
				res.data = false;
				res.msg = "保存失败";
			}

			return res;
		}

        /// <summary>
        /// 获取用户角色权限
        /// </summary>
        /// <returns></returns>
        [Route("GetRoleFunctions/{code}")]
        [HttpPost]
        public DataRes<IEnumerable<string>> GetRoleFunctions(string code)
        {
            DataRes<IEnumerable<string>> res = new DataRes<IEnumerable<string>>() { code = ResCode.Success };
            var list= new Pub_RolefunctionBLL().GetList($"RoleCode IN(SELECT  RoleCode FROM Pub_UserRole WHERE UserCode='{code}')");
            res.data = list.Select(p => p.FunctionCode);

            return res;
        }

    }
}