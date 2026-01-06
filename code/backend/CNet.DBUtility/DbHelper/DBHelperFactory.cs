using CNet.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CNet;

public class DBHelperFactory
{
    private static IDapperHelper iDapperHelper;
    public static IDapperHelper Instance_Main { get; } = new DapperHelperMySql(Connection.MainStr);

}

