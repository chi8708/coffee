
//////此代码由CNetCodeGen生成， 作者：cts 生成时间：2025-07-01 15:20:07
using System;
using Dapper.Contrib.Extensions;
namespace CNet.Model.Main
{
     /// <summary>
    ///  
    ///</summary>
    [Table("gen_log")]
    public partial class gen_log
    {

        /// <summary>
        /// 
        ///</summary>

        [Key]
            public int Id { get; set; }
    
        /// <summary>
        /// 
        ///</summary>
        public DateTime CreateTime { get; set; }
    
        /// <summary>
        /// 
        ///</summary>
        public string GenInfo { get; set; }
    
        /// <summary>
        /// 
        ///</summary>
        public int Status { get; set; }
    
        /// <summary>
        /// 
        ///</summary>
        public string TableName { get; set; }
    
   }
}