using System;
using System.Data;
using System.Configuration;
using System.Web; 
using DataAccess;
using DataAccess.Entitys;
using System.Data.SqlClient;

namespace DataAcess.Entitys
{
    public class FAQs:IBaseEntitys
    {
        public int FaqID { get; set; }
        public string Question { get; set; }
        public string Answers { get; set; }
        public int Rating { get; set; }
        public int Status { get; set; }

        public string strWhere { get; set; }
        public string strOrder { get; set; }

        #region IBaseEntitys Members

        public void BinUpdate(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@FaqID", FaqID, cmd);
            ConnectSQL.Bindings("@Question", Question, cmd);
            ConnectSQL.Bindings("@Answers", Answers, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }
        public void BinInsert(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@Question", Question, cmd);
            ConnectSQL.Bindings("@Answers", Answers, cmd);
            ConnectSQL.Bindings("@Status", Status, cmd);
        }
        public void BinByWhere(System.Data.SqlClient.SqlCommand cmd)
        {
            ConnectSQL.Bindings("@strWhere", strWhere, cmd);
            ConnectSQL.Bindings("@strOrder", strOrder, cmd);
        }
 

        public void BinDelete(SqlCommand cmd)
        {
            ConnectSQL.Bindings("@FaqID", FaqID, cmd);
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
            FAQs fa = (FAQs)ibe;
            ConnectSQL cn = new ConnectSQL();
            i = cn.Insert(Insert_Values, fa);

            return i;
        }

        public DataTable GetByWhere(IBaseEntitys ibe)
        {
            ConnectSQL cn = new ConnectSQL();
            FAQs fa = (FAQs)ibe;
            DataTable dt = cn.SelectByWhere(Select_GetByWhere, fa);

            return dt;
        }

        public int Update(IBaseEntitys ibe)
        {
            int i = 0;
            ConnectSQL cn = new ConnectSQL();
            try
            {
                FAQs fa = (FAQs)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Update_Values, fa);
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
                FAQs fa = (FAQs)ibe;
                SqlCommand cmd = cn.ExecuteQuery(Delete_Values, fa);
                fa.BinDelete(cmd);
                i = cmd.ExecuteNonQuery();
                return i;
            }
            finally
            {
                cn.CloseCn();
            }
        }

        #endregion

        private const string Select_GetByAll        = "FAQs_GetbyAll";
        private const string Select_GetByWhere      = "FAQs_GetbyWhere";
        private const string Insert_Values          = "FAQs_Insert";
        private const string Update_Values          = "FAQs_Update";
        private const string Delete_Values          = "FAQs_Delete";
    }
}
