using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAcess.Entitys;

namespace BussinessRules
{
    public class SeveritysBO
    {
        private static Severitys severity = new Severitys();
        public static DataTable GetByAll()
        {
            DataTable tbSeveritys = severity.GetByAll();

            return tbSeveritys;
        }
        public static DataTable GetByWhere(Severitys s)
        {
            DataTable tbSeveritys = severity.GetByWhere(s);

            return tbSeveritys;
        }
        public static int Insert(Severitys s)
        {
            int i = 0;
            i = severity.Insert(s);

            return i;
        }
        public static int Update(Severitys s)
        {
            int i = 0;
            severity.SeverityID = s.SeverityID;
            severity.SeverityName = s.SeverityName;
            severity.Status = s.Status;

            return i = severity.Update(severity);
        }
        public static int Delete(Severitys s)
        {
            int i = 0;

            i = severity.Delete(s);
            return i;
        }
    }
}
