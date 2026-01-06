using Autofac;
using Autofac.Extensions.DependencyInjection;
using CNet.BLL.Main;
using CNet.Common;
using CNet.DAL.Main;
using CNet.Model.Main;
using CNet.Web.Api.Controllers;
using log4net;
using log4net.Config;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using CNet.Web.Api.Core.Captcha;
using Microsoft.Extensions.Options;
using Swashbuckle.AspNetCore.Swagger;
using Google.Protobuf.WellKnownTypes;

namespace CNet.Web.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            LogConfig();

        }
        
        //日志配置
        private static void LogConfig()
        {
            // //log4Net
            var logTypes = System.Enum.GetValues(typeof(LogType));
            foreach (LogType logType in logTypes)
            {
                var repository = LogManager.CreateRepository(logType.ToString());
                XmlConfigurator.Configure(repository, new FileInfo(Environment.CurrentDirectory + "/log4net.config"));
            }
        }

        public IConfiguration Configuration { get; }
        /// <summary>
        /// 这段代码必须放在Startup类里面
        /// </summary>
        /// <param name="builder"></param>
        public void ConfigureContainer(ContainerBuilder builder)
        {

			//构造函数注入
			//builder.RegisterType<IBaseDataDapperContrib>().As<BaseDataDapperContrib>();
			//属性注入：
			//builder.RegisterType<EmployeeService>().As<IEmployeeService>().PropertiesAutowired();//只能在当前的EmployeeService类，使用属性注入
			//Autofac批量
			//需要 using 命名空间 System.Reflection  Straup.cs 文件中的 ConfigureContainer() 方法 
			//约定接口（Interface）和实现（class）都是以 Service 【或者其他】结尾的。
			//泛型注册

			//builder.RegisterGeneric(typeof(BaseDataDapperContrib<>)).As(typeof(IBaseDataDapperContrib<>));
			//builder.RegisterGeneric(typeof(BaseServiceDapperContrib<>)).AsSelf().PropertiesAutowired();//属性注册服务//假如要注册就用从控制器开始注册
			////var basedir = Path.Combine(Directory.GetCurrentDirectory(), "lib");

			////var assemblysBLL = Assembly.Load($"{basedir}/CNet.BLL.dll");//Service是继承接口的实现方法类库名称
			////var assemblysDAL = Assembly.LoadFile($"{basedir}/CNet.DAL.dll");//Service是继承接口的实现方法类库名称
			//var assemblysBLL = Assembly.Load($"CNet.BLL");
			//var assemblysDAL = Assembly.Load($"CNet.DAL");
			//////var baseType = typeof(IBaseService<>);//IDependency 是一个接口（所有要实现依赖注入的借口都要继承该接口）

			//builder.RegisterAssemblyTypes(assemblysBLL)
			//     .Where(t => (t.BaseType != null && t.BaseType.Name.StartsWith("BaseService")))
			//     .AsSelf().InstancePerLifetimeScope();

			//builder.RegisterAssemblyTypes(assemblysDAL)
			//     .Where(t => (t.BaseType != null && t.BaseType.Name.StartsWith("BaseDataDapperContrib")))
			//    .AsSelf().InstancePerLifetimeScope();


		}



        //依赖注入服务
        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //1.全局异常 2.Json 日期格式化
            services
                .AddMvc(o => 
                {
                    o.Filters.Add(typeof(WebApiExceptionAttribute));
                    o.EnableEndpointRouting = false;
					//o.Filters.Add<FormatResultFilter>(20);//格式化输出值
				});
            services.AddControllers().AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            });

            //参考 https://www.cnblogs.com/aishangyipiyema/p/9262642.html
            JWTConfig(services);

            SwaggerConfig(services);

            services.AddCors(options =>
            {

                // this defines a CORS policy called "default"

                options.AddPolicy("default", policy =>
                {

                    policy.WithOrigins("*").AllowAnyHeader().AllowAnyMethod();

                });

            });
            //services.AddControllers();

            services.AddControllers(options =>
            {
                //options.Filters.Add(typeof(ApiExceptionFilter));
            });
            
            //同步读取body的方式需要ConfigureServices中配置允许同步读取IO流，否则可能会抛出异常 Synchronous operations are disallowed. Call ReadAsync or set AllowSynchronousIO to true instead.
            services.Configure<KestrelServerOptions>(x => x.AllowSynchronousIO = true)
                        .Configure<IISServerOptions>(x => x.AllowSynchronousIO = true);

			//滑块验证码
			services.AddSlideCaptcha(Configuration, options =>
			{
				options.StoreageKeyPrefix ="CNET";
			});
			services.AddScoped<ISlideCaptcha, SlideCaptcha>();


		}

		private static void SwaggerConfig(IServiceCollection services)
        {
            //注册Swagger生成器，定义一个和多个Swagger 文档
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "CNet API",
                    Version = "v1",
                    Description = "CNet基础框架API",
                });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Description = "直接在下框中输入Bearer {token}（注意两者之间是一个空格）",
                    Name = "Authorization",
                    BearerFormat = "JWT",
                    Scheme = "Bearer"
                });
                //不加AddSecurityRequirement请求头不会有authorization
                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                  {
                    new OpenApiSecurityScheme
                    {
                      Reference=new OpenApiReference
                      {
                        Type=ReferenceType.SecurityScheme,
                        Id="Bearer"
                      }
                    },
                    new string[] {}
                  }
                });
                //swagger中控制请求的时候发是否需要在url中增加accesstoken
                // c.OperationFilter<AuthTokenHeaderParameter>();


                //这里我们将用户相关的API分成一组,这里的User就是文档名称(documentName)
                c.SwaggerDoc("Admin", new Microsoft.OpenApi.Models.OpenApiInfo()
                {
                    Title = "系统管理",
                    Version = "1.0"
                });
                c.SwaggerDoc("Test", new Microsoft.OpenApi.Models.OpenApiInfo()
                {
                    Title = "测试接口",
                    Version = "1.0"
                });


                // 为 Swagger JSON and UI设置xml文档注释路径
                //HttpContext.Current.Request.PhysicalApplicationPath
                //System.IO.Directory.GetCurrentDirectory();
                var basePath = Path.GetDirectoryName(typeof(Program).Assembly.Location);//获取应用程序所在目录（绝对，不受工作目录影响，建议采用此方法获取路径）
                var xmlPath = Path.Combine(basePath, "CNet.Web.Api.xml");
                c.IncludeXmlComments(xmlPath,true);
			});
        }


        /// <summary>
        /// 使用 Microsoft.AspNetCore.Authentication.JwtBearer
        /// </summary>
        /// <param name="services"></param>
        private void JWTConfig(IServiceCollection services)
        {
            services.Configure<JwtSeetings>(Configuration.GetSection("JwtSeetings"));
            var jwtSeetings = new JwtSeetings();
            //绑定jwtSeetings
            Configuration.Bind("JwtSeetings", jwtSeetings);
            services.AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;

            })
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = jwtSeetings.Issuer,
                    ValidAudience = jwtSeetings.Audience,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSeetings.SecretKey)),
                    ValidateLifetime = false//不验证过期时间
                };
            });
        }

        //中间件
        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
				app.UseSwagger(swaggerOptions =>
				{
					//告诉OpenApi Json 信息请求拦截中间件，收到以下格式的请求时返回OpenApi Json信息
					//注意：路径中必须包含: {documentName}，Swagger 中间件从请求路径中{documentName}占位符位置提取出api 文档名称，以便显示分组到该文档名称下的 
					//所有api信息。
					swaggerOptions.RouteTemplate = "/CNetWebApi/{documentName}/swagger.json";
				});
				app.UseSwaggerUI(c => {
					//定义用户管理相关API的OpenApi Json 信息请求路径。控制器[ApiExplorerSettings(GroupName = "Dept")]标记
					c.SwaggerEndpoint("/CNetWebApi/Admin/swagger.json", "Admin");
					//c.SwaggerEndpoint("/CNetWebApi/Dept/swagger.json", "DeptManagerApis");//分组
					c.SwaggerEndpoint("/CNetWebApi/Test/swagger.json", "Test");
                    c.EnableFilter();
                    });
            }
            //Microsfot.Extensions.Logging.Log4Net.AspNetCore 需添加
            //loggerFactory.AddLog4Net(Environment.CurrentDirectory + "//log4net.config");
            //app.UseHttpsRedirection();//会跳转跨域时不要使用


            app.UseRouting();
            // app.UseMvc();

            app.UseStaticFiles();
            ////jwt认证 需要在app.UseMvc()前调用
            app.UseAuthentication();//不添加报401
           app.UseCors("default");
          // app.UseCors(anyAllowSpecificOrigins);//支持跨域：允许特定来源的主机访问
            app.UseAuthorization();

            //request.body的长度总是为0
            app.Use(next => context =>
            {
                context.Request.EnableBuffering();
                return next(context);
            });

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers().RequireCors("default");
            });

        }
    }
}
