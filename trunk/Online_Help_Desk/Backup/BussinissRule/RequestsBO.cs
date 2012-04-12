using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAcess.Entitys;

namespace BussinessRules
{
    public class RequestsBO
    {
        private static Requests request = new Requests();
        public static DataTable GetByAll()
        {
            DataTable tbUser = request.GetByAll();

            return tbUser;
        }
        public static DataTable GetByWhere(Requests r)
        {
            DataTable tbUsers = request.GetByWhere(r);

            return tbUsers;
        }
        public static int Update(Requests r)
        {
            int i = 0;
            request.RequestID = r.RequestID;
            request.StatusID = r.StatusID;
            request.RequestName = r.RequestName;
            request.RequestSubject = r.RequestSubject;
            request.RequestDetail = r.RequestDetail;
            request.RequestDate = r.RequestDate;
            request.RequestLastDate = r.RequestLastDate;
            request.SeverityID = r.SeverityID;
            request.Status = r.Status;

            return i = request.Update(request);
        }
        public static int Delete(Requests r)
        {
            int i = 0;

            i = request.Delete(r);
            return i;
        }
    }
}
