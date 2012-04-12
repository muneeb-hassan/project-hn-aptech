using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAccess.Entitys;
using DataAccess;
using System.Data.SqlClient;

namespace DataAcess.Entitys
{
    public class Requests:IBaseEntitys
    {
        public int RequestID { get; set; }
        public int UserID { get; set; }
        public int FacilityID { get; set; }
        public int SeverityID { get; set; }
        public int StatusID { get; set; }
        public string RequestName { get; set; }
        public string RequestSubject { get; set; }
        public string RequestDetail { get; set; }
        public DateTime RequestDate { get; set; }
        public DateTime RequestLastDate { get; set; }
        public bool Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        #region IBaseEntitys Members

        public void BinUpdate(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RequestID", RequestID, cmd);
            ConnectSQL.Bindings("@UserID", UserID, cmd);
            ConnectSQL.Bindings("@StatusID", StatusID, cmd);
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@SeverityID", SeverityID, cmd);
            ConnectSQL.Bindings("@RequestName", RequestName, cmd);
            ConnectSQL.Bindings("@RequestSubject", RequestSubject, cmd);
            ConnectSQL.Bindings("@RequestDetail", RequestDetail, cmd);
            ConnectSQL.Bindings("@RequestDate", RequestDate, cmd);
            ConnectSQL.Bindings("@RequestLastDate", RequestLastDate, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinInsert(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@UserID", UserID, cmd);
            ConnectSQL.Bindings("@StatusID", StatusID, cmd);
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@SeverityID", SeverityID, cmd);
            ConnectSQL.Bindings("@RequestName", RequestName, cmd);
            ConnectSQL.Bindings("@RequestSubject", RequestSubject, cmd);
            ConnectSQL.Bindings("@RequestDetail", RequestDetail, cmd);
            ConnectSQL.Bindings("@RequestDate", RequestDate, cmd);
            ConnectSQL.Bindings("@RequestLastDate", RequestLastDate, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }

        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RequestID", RequestID, cmd);
        }

        #endregion
        
        #region Method Members

        public DataTable GetByAll()
        {
            ConnectSQL cn = new ConnectSQL();
            DataTable dt = cn.Select(Select_GetByAll, this);

            return dt;
        }

        public int Insert(IBaseEntitys ibe)
        {
            int i = 0;
            Requests request = (Requests)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, request);

            return i;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Requests request = (Requests)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, request);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Requests request = (Requests)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, request);
                BinUpdate(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        }

        public int Delete(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Requests request = (Requests)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, request);
                request.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        } 

        #endregion

        private const string Select_GetByAll        = "Request_GetbyAll";
        private const string Select_GetByWhere      = "Request_GetbyWhere";
        private const string Insert_Values          = "Request_Insert";
        private const string Update_Values          = "Request_Update";
        private const string Delete_Values          = "Request_Delete";
    }
}
