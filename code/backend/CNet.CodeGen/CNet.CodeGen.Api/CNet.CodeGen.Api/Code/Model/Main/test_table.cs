
//////此代码由CNetCodeGen生成， 作者：cts 生成时间：2025-07-02 17:13:56
using System;
using Dapper.Contrib.Extensions;
namespace CNet.Model.Main
{
     /// <summary>
    ///  
    ///</summary>
    [Table("test_table")]
    public partial class test_table
    {

        /// <summary>
        /// 
        ///</summary>

        [Key]
            public int Id { get; set; }
    
        /// <summary>
        /// 用户名
        ///</summary>
        public string Name { get; set; }
    
        /// <summary>
        /// 生日
        ///</summary>
        public DateTime Brithday { get; set; }
    
        /// <summary>
        /// 
        ///</summary>
        public bool StopFlag { get; set; }
    
   }
}