using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CNet.Model
{
    public class PageDateRes<T> where T:class,new()
    {
        public ResCode code { get; set; }

        public string msg { get; set; }

        public int count { get; set; }

        public int totalPage { get; set; }

        public List<T> data { get; set; }

        public int PageNum { get; set; }

        public int PageSize { get; set; }
    }

    public class PageDataReq
    {
        //  int pageNum = 1, int pageSize = 10, string field = "id", string order = " desc "
        public int pageNum { get; set; } = 1;
        public int pageSize { get; set; } = 10;

        public string field { get; set; }
        public string order { get; set; }

        public Dictionary<string, object> query { get; set; }
    }
}
