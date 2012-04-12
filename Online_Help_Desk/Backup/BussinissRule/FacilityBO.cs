using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataAcesss.Entitys;
using System.Data;

namespace BussinissRule
{
    public class FacilityBO
    {
        private static Facilitys facility = new Facilitys();
        public static DataTable GetByAll()
        {
            DataTable tbfac = facility.GetByAll();

            return tbfac;
        }
        public static DataTable GetByWhere(Facilitys f)
        {
            DataTable tbFacilitys = facility.GetByWhere(f);

            return tbFacilitys;
        }
        public static int Insert(Facilitys f)
        {
            int i = 0;
            i = facility.Insert(f);

            return i;
        }
        public static int Update(Facilitys f)
        {
            int i = 0;
            facility.FacilityID = f.FacilityID;
            facility.FacilityName = f.FacilityName;
            facility.Status = f.Status;

            return i = facility.Update(facility);
        }
        public static int Delete(Facilitys f)
        {
            int i = 0;

            i = facility.Delete(f);
            return i;
        }
    }
}
