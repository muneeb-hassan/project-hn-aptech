using System;
using System.Data;
using System.Configuration;
using System.Web; 
using System.Data.SqlClient;

namespace DataAccess.Entitys
{
    public class Roless : IBaseEntitys
    {
        public int RoleID { get; set; }
        public string RoleName { get; set; }
        public int Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        public Roless() { }

        #region IBaseEntitys Members

        public void BinUpdate(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RoleID", RoleID, cmd);
            ConnectSQL.Bindings("@RoleName", RoleName, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }
        
        public void BinInsert(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RoleName", RoleName, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }
        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RoleID", RoleID, cmd);
        }

        #endregion

        #region Method_Users

        public DataTable GetByAll()
        {
            ConnectSQL cn = new ConnectSQL();
            DataTable dt = cn.Select(Select_GetByAll, this);

            return dt;
        }
 
        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Roless role = (Roless)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, role);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Roless role = (Roless)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, role);
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
                Roless role = (Roless)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, role);
                role.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        }

        public int Insert(IBaseEntitys ibe)
        {
            int i = 0;
            Roless role = (Roless)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, role);

            return i;
        }

        #endregion

        private const string Select_GetByAll        = "Roles_GetbyAll";
        private const string Select_GetByWhere      = "Roles_GetbyWhere";
        private const string Insert_Values          = "Roles_Insert";
        private const string Update_Values          = "Roles__Update";
        private const string Delete_Values          = "Roles_Delete";
 
    }
}
