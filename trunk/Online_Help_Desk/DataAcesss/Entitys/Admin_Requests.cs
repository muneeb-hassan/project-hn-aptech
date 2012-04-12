using System;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess.Entitys
{
    public class Admin_Requests : IBaseEntitys
    {
        public int UserID { get; set; }
        public int RequestID { get; set; }
        public string Remark { get; set; }
        public bool Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        public Admin_Requests() { }
        public Admin_Requests(string moreScipt)
        {
            MORESCRIPT = moreScipt;
        }

        #region IBaseEntitys Members

        public void BinUpdate(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@UserID", UserID, cmd);
            ConnectSQL.Bindings("@RequestID", RequestID, cmd);
            ConnectSQL.Bindings("@Remark", Remark, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinInsert(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@UserID", UserID, cmd);
            ConnectSQL.Bindings("@RequestID", RequestID, cmd);
            ConnectSQL.Bindings("@Remark", Remark, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }
        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }

        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@UserID", UserID, cmd);
            ConnectSQL.Bindings("@RequestID", RequestID, cmd);
        }

        #endregion

        #region Method_Category

        public DataTable GetByAll()
        {
            ConnectSQL cn = new ConnectSQL();
            DataTable dt = cn.Select(Select_GetByAll, this);

            return dt;
        }

        public int Insert(IBaseEntitys ibe)
        {
            int i = 0;
            Admin_Requests user_request = (Admin_Requests)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, user_request);

            return i;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Admin_Requests user_request = (Admin_Requests)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, user_request);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Admin_Requests user_request = (Admin_Requests)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, user_request);
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
                Admin_Requests user_request = (Admin_Requests)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, user_request);
                user_request.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        } 
         
        #endregion

        private string MORESCRIPT = "";
        private const string Select_GetByAll        = "Admin_Request_GetbyAll";
        private const string Select_GetByWhere      = "Admin_Request_GetbyWhere";
        private const string Insert_Values          = "Admin_Request_Insert";
        private const string Update_Values          = "Admin_Request_Update";
        private const string Delete_Values          = "Admin_Request_Delete";
    }
}
