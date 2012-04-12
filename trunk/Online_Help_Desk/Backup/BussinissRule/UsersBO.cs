using System;
using System.Data;
using DataAccess.Entitys;
using DataAccess;
using System.Collections.Generic;

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
            user.Gender = u.Gender;
            user.DateRegister = u.DateRegister;
            user.PassWord = u.PassWord;
            user.FirstName = u.FirstName;
            user.UserName = u.UserName;
            user.Telephone = u.Telephone;
            user.Email = u.Email;
            user.Address = u.Address;

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
                    if (uName.ToLower().Equals(userName) && uPass.ToLower().Equals(Password))
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
    }
}
