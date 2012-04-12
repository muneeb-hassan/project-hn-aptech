using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAccess;
using DataAccess.Entitys;
using System.Data.SqlClient;

namespace DataAcess.Entitys
{
    public class Status:IBaseEntitys
    {
        public int StatusID { get; set; }
        public string StatusName { get; set; }
        public bool status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        #region IBaseEntitys Members

        public void BinUpdate(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@StatusID", StatusID, cmd);
            ConnectSQL.Bindings("@StatusName", StatusName, cmd); 
        }

        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }

        public void BinInsert(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@StatusName", StatusName, cmd);
            ConnectSQL.Bindings("@Status", status, cmd);
        }

        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@StatusID", StatusID, cmd);
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
            Status status = (Status)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, status);

            return i;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Status status = (Status)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, status);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Status status = (Status)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, status);
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
                Status status = (Status)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, status);
                status.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        }

        #endregion

        private const string Select_GetByAll        = "Status_GetbyAll";
        private const string Select_GetByWhere      = "Status_GetbyWhere";
        private const string Insert_Values          = "Status_Insert";
        private const string Update_Values          = "Status_Update";
        private const string Delete_Values          = "Status_Delete";
    }
}
