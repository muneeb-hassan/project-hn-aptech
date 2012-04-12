using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAccess.Entitys;

namespace BussinessRules
{
    public class Users_RequestsBO
    {
        private static Admin_Requests user_request = new Admin_Requests();
        public static DataTable GetByAll()
        {
            DataTable tbUser = user_request.GetByAll();

            return tbUser;
        }
        public static DataTable GetByWhere(Admin_Requests u_request)
        {
            DataTable tbUsers = user_request.GetByWhere(u_request);

            return tbUsers;
        }
        public static int Insert(Admin_Requests u)
        {
            int i = 0;
            i = user_request.Insert(u);

            return i;
        }

        public static int Update(Admin_Requests u)
        {
            int i = 0;
            user_request.UserID = u.UserID;
            user_request.RequestID = u.RequestID;
            user_request.Remark = u.Remark;
            user_request.Status = u.Status;

            return i = user_request.Update(user_request);
        }
        public static int Delete(Admin_Requests u)
        {
            int i = 0;

            i = user_request.Delete(u);
            return i;
        }
    }
}
