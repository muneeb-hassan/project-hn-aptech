using System;
using System.Data;
using DataAccess.Entitys;
using DataAccess;
using System.Collections.Generic;
using DataAcesss.Entitys;

namespace BusinessRules
{
    public class UsersBO
    {
        private static Users user = new Users();
        public static DataTable GetByAll()
        {
            DataTable tbUser = user.GetByAll();

            return tbUser;
        }
        public static DataTable GetByWhere(Users u)
        {
            DataTable tbUsers = user.GetByWhere(u);

            return tbUsers;
        }
        public static int Insert(Users u)
        {
            int i = 0;
            i = user.Insert(u);

            return i;
        }

        public static int Update(Users u)
        {
            int i = 0;
            user.UserID = u.UserID;
            user.FacilityID = u.FacilityID;
            user.RoleID = u.RoleID;
            user.Gender = u.Gender;
            user.LastName = u.LastName;
            user.RegisterDate = u.RegisterDate;
            user.PassWord = u.PassWord;
            user.FirstName = u.FirstName;
            user.UserName = u.UserName;
            user.PhoneNumber = u.PhoneNumber;
            user.Email = u.Email;
            user.Address = u.Address;
            user.Status = u.Status;

            return i = user.Update(user);
        }
        public static int Delete(Users u)
        {
            int i = 0;

            i = user.Delete(u);
            return i;
        }
        public static List<Users> CheckLogin(string userName, string Password)
        {
            DataTable dtAllUsers = user.GetByAll();
            List<Users> listUsers = new List<Users>();
            if (dtAllUsers.Rows.Count > 0)
            {
                for (int i = 0; i < dtAllUsers.Rows.Count; i++)
                {
                    Users users = new Users();
                    int uID = Convert.ToInt32(dtAllUsers.Rows[i]["UserID"]);
                    string uName = dtAllUsers.Rows[i]["UserName"].ToString();
                    string uPass = dtAllUsers.Rows[i]["PassWord"].ToString();
                    if (uName.ToLower().Equals(userName.ToLower()) && uPass.ToLower().Equals(Password.ToLower()))
                    {
                        users.UserID = uID;
                        users.UserName = uName;
                        users.PassWord = uPass;

                        listUsers.Add(users);
                    }
                }
            }
            return listUsers;
        }

        public static string CheckPermission(int _userID)
        {
            Users users = new Users();
            users.UserID = _userID;
            users.strWhere = "UserID = " + _userID;

            DataTable dtUsers = UsersBO.GetByWhere(users);
            string roleName = string.Empty;
            if (dtUsers.Rows.Count > 0)
            {
                int roleID = Convert.ToInt32(dtUsers.Rows[0]["RoleID"]);
                Roless roles = new Roless();
                roles.RoleID = roleID;
                roles.strWhere = "RoleID = " + roleID;

                DataTable dtRoles = RolesBO.getByWhere(roles);
                if (dtRoles.Rows.Count > 0)
                {
                    roleName = dtRoles.Rows[0]["RoleName"].ToString();
                } 
            }
            return roleName;
        }
    }
}
