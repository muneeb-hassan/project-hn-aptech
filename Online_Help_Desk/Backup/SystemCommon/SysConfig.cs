using System;
using System.Data;
using System.Web; 

namespace SystemCommon
{
    public class SysConfig
    {
        public static string strConfig(){
            string strCn = string.Empty;
            return  strCn = System.Configuration.ConfigurationSettings.AppSettings["strConnect"].ToString();
        }
    }
}
