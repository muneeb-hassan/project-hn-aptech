using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAcess.Entitys;

namespace BussinessRules
{
    public class StatusBO
    {
        private static Status status = new Status();
        public static DataTable GetByAll()
        {
            DataTable tbStatus = status.GetByAll();

            return tbStatus;
        }
        public static DataTable GetByWhere(Status st)
        {
            DataTable tbStatus = status.GetByWhere(st);

            return tbStatus;
        }
        public static int Insert(Status st)
        {
            int i = 0;
            i = status.Insert(st);

            return i;
        }

        public static int Update(Status st)
        {
            int i = 0;
            status.StatusID = st.StatusID;
            status.StatusName = st.StatusName;
            status.status = st.status;

            return i = status.Update(status);
        }
        public static int Delete(Status st)
        {
            int i = 0;

            i = status.Delete(st);
            return i;
        }
    }
}
