using System;
using System.Data;
using System.Configuration; 
using DataAccess;
using DataAccess.Entitys;

namespace BusinessRules
{
    public class RolesBO
    {
        private static Roless role = new Roless();
        public static DataTable GetByAll()
        {
            DataTable tbRoles = role.GetByAll();
            
            return tbRoles;
        }
        public static DataTable getByWhere(Roless r)
        {
            DataTable tbRoles = role.GetByWhere(r);

            return tbRoles;
        }
        public static int Update(Roless r)
        {
            int i = 0;
            role.RoleID = r.RoleID;
            role.RoleName = r.RoleName;
           
            return i = role.Update(role);
        }
        public static int Delete(Roless r)
        {
            int i = 0;

            i = role.Delete(r);
            return i;
        }
    }
}
