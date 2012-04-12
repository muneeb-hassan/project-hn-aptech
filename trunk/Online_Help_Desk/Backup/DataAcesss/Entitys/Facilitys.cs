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
    public class Facilitys :IBaseEntitys
    {
        public int FacilityID { get; set; }
        public string FacilityName { get; set; }
        public int Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        #region IBaseEntitys Members

        public void BinUpdate(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
            ConnectSQL.Bindings("@FacilityName", FacilityName, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinInsert(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@FacilityName", FacilityName, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }

        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }

        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@FacilityID", FacilityID, cmd);
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
            Facilitys facility = (Facilitys)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, facility);

            return i;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            Facilitys facility = (Facilitys)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, facility);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                Facilitys facility = (Facilitys)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, facility);
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
                Facilitys facility = (Facilitys)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, facility);
                facility.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        }

        #endregion

        private const string Select_GetByAll        = "Facilitys_GetbyAll";
        private const string Select_GetByWhere      = "Facilitys_GetbyWhere";
        private const string Insert_Values          = "Facilitys_Insert";
        private const string Update_Values          = "Facilitys_Update";
        private const string Delete_Values          = "Facilitys_Delete";
    }
}
