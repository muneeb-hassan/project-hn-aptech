using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataAccess.Entitys;
using DataAccess;
using DataAcesss.Entitys;

namespace BussinissRule
{
    public class AdminBO
    {
        private static Admin admin = new Admin();
        public static DataTable GetByAll()
        {
            DataTable tbadmin = admin.GetByAll();

            return tbadmin;
        }
        public static DataTable GetByWhere(Admin adm)
        {
            DataTable tbAdmin = admin.GetByWhere(adm);

            return tbAdmin;
        }
        public static int Insert(Admin adm)
        {
            int i = 0;
            i = admin.Insert(adm);

            return i;
        }

        public static int Update(Admin adm)
        {
            int i = 0;
            admin.FacilityID = adm.FacilityID;
            admin.RoleID = adm.RoleID;
            admin.Gender = adm.Gender;
            admin.DateRegister = adm.DateRegister;
            admin.PassWord = adm.PassWord;
            admin.FirstName = adm.FirstName;
            admin.AdminName = adm.AdminName;
            admin.Telephone = adm.Address;
            admin.Email = adm.Email;
            admin.Address = adm.Address;

            return i = admin.Update(admin);
        }
        public static int Delete(Admin ad)
        {
            int i = 0;

            i = admin.Delete(ad);
            return i;
        }
    }
}
