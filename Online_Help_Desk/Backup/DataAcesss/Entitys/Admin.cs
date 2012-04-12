using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAccess.Entitys;
using DataAccess;
using System.Data.SqlClient;
using System.Data;

namespace DataAcesss.Entitys
{
    public class Admin:IBaseEntitys
    {
        public int AdminID { get; set; }
        public int RoleID { get; set; }
        public int FacilityID { get; set; }
        public string AdminName { get; set; }
        public string FirstName { get; set; }
        public string PassWord { get; set; }
        public bool Gender { get; set; }
        public DateTime DateRegister { get; set; }
        public string Address { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }


        public string strWhere { get; set; }
        public string strOrder { get; set; }

        public Admin() { } 

        #region IBaseEntitys Members

        public void BinUpdate(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@AdminID", AdminID, cmd);
            ConnectSQL.Bindings("@RoleID", RoleID, cmd);
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@AdminName", AdminName, cmd);
            ConnectSQL.Bindings("@PassWord", PassWord, cmd);
            ConnectSQL.Bindings("@FirstName", FirstName, cmd);
            ConnectSQL.Bindings("@Gender", Gender, cmd);
            ConnectSQL.Bindings("@DateRegister", DateRegister, cmd);
            ConnectSQL.Bindings("@Address", Address, cmd);
            ConnectSQL.Bindings("@Telephone", Telephone, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
            ConnectSQL.Bindings("@Email", Email, cmd);
        }
        public void BinInsert(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RoleID", RoleID, cmd);
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@AdminName", AdminName, cmd);
            ConnectSQL.Bindings("@PassWord", PassWord, cmd);
            ConnectSQL.Bindings("@FirstName", FirstName, cmd);
            ConnectSQL.Bindings("@Gender", Gender, cmd);
            ConnectSQL.Bindings("@DateRegister", DateRegister, cmd);
            ConnectSQL.Bindings("@Address", Address, cmd);
            ConnectSQL.Bindings("@Telephone", Telephone, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
            ConnectSQL.Bindings("@Email", Email, cmd);
        }

        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }

        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@AdminID", AdminID, cmd);
        }

        #endregion

        #region Method_Admin

        public DataTable GetByAll()
        {
            ConnectSQL cn = new ConnectSQL();
            DataTable dt = cn.Select(Select_GetByAll, this);
            
            return dt;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Admin admin = (Admin)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, admin);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try{
                Admin admin = (Admin)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, admin);
                BinUpdate(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }finally{
                cn.CloseCn();
            }
        }

        public int Delete(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Admin admin = (Admin)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, admin);
                admin.BinDelete(cmd);
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
            Admin admin = (Admin)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, admin);

            return i;
        }
      
        #endregion

        private string MORESCRIPT = "";
        private const string Select_GetByAll        = "Admin_GetbyAll";
        private const string Select_GetByWhere      = "Admin_GetbyWhere";
        private const string Insert_Values          = "Admin_Insert";
        private const string Update_Values          = "Admin_Update";
        private const string Delete_Values          = "Admin_Delete";
    }
}
