using System;
using System.Data;
using System.Configuration;
using System.Web; 
using System.Data.SqlClient;

namespace DataAccess.Entitys
{
    public class Users : IBaseEntitys
    {
        public int UserID { get; set; } 
        public int RoleID { get; set; }
        public int FacilityID { get; set; }
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PassWord { get; set; }
        public bool Gender { get; set; }
        public DateTime RegisterDate { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public bool Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        public Users() { }

        public Users(string moreScript)
        {
            MORESCRIPT = moreScript;
        }

        #region IBaseEntitys Members

        public void BinUpdate(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@UserID", UserID, cmd);
            ConnectSQL.Bindings("@RoleID", RoleID, cmd);
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@UserName", UserName, cmd);
            ConnectSQL.Bindings("@LastName", LastName, cmd);
            ConnectSQL.Bindings("@PassWord", PassWord, cmd);
            ConnectSQL.Bindings("@FirstName", FirstName, cmd);
            ConnectSQL.Bindings("@Gender", Gender, cmd);
            ConnectSQL.Bindings("@RegisterDate",RegisterDate, cmd);
            ConnectSQL.Bindings("@Address", Address, cmd);
            ConnectSQL.Bindings("@PhoneNumber", PhoneNumber, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
            ConnectSQL.Bindings("@Email", Email, cmd);
        }
        public void BinInsert(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@RoleID", RoleID, cmd);
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@UserName", UserName, cmd);
            ConnectSQL.Bindings("@LastName", LastName, cmd);
            ConnectSQL.Bindings("@PassWord", PassWord, cmd);
            ConnectSQL.Bindings("@FirstName", FirstName, cmd);
            ConnectSQL.Bindings("@Gender", Gender, cmd);
            ConnectSQL.Bindings("@RegisterDate", RegisterDate, cmd);
            ConnectSQL.Bindings("@Address", Address, cmd);
            ConnectSQL.Bindings("@Telephone", PhoneNumber, cmd);
            ConnectSQL.Bindings("@Email", Email, cmd);
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
            Users user = (Users)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, user);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try{
                Users users = (Users)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, users);
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
                Users users = (Users)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, users);
                users.BinDelete(cmd);
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
            Users users = (Users)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values,users);

            return i;
        }
        
      
        #endregion

        private string MORESCRIPT = "";
        private const string Select_GetByAll        = "Users_GetbyAll";
        private const string Select_GetByWhere      = "Users_GetbyWhere";
        private const string Insert_Values          = "Users_Insert";
        private const string Update_Values          = "Users__Update";
        private const string Delete_Values          = "Users_Delete";
        
 
    }
}
