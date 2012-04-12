using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAccess.Entitys;
using DataAccess;
using System.Data.SqlClient;

namespace DataAcess.Entitys
{
    public class Severitys : IBaseEntitys
    {
        public int SeverityID { get; set; }
        public string SeverityName { get; set; }
        public int Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        #region IBaseEntitys Members

        public void BinUpdate(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@SeverityID", SeverityID, cmd);
            ConnectSQL.Bindings("@SeverityName", SeverityName, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinInsert(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@SeverityName", SeverityName, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }
 
        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@SeverityID", SeverityID, cmd);
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
            Severitys severity = (Severitys)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, severity);

            return i;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Severitys severity = (Severitys)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, severity);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Severitys severity = (Severitys)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, severity);
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
                Severitys severity = (Severitys)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, severity);
                severity.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        }

        #endregion

        private const string Select_GetByAll            = "Severity_GetbyAll";
        private const string Select_GetByWhere          = "Severity_GetbyWhere";
        private const string Insert_Values              = "Severity_Insert";
        private const string Update_Values              = "Severity_Update";
        private const string Delete_Values              = "Severity_Delete";
    }
}
