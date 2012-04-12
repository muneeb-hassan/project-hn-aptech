using System;
using System.Data;
using System.Configuration;
using System.Web; 
using System.Data.SqlClient;

namespace DataAccess.Entitys
{
    public interface IBaseEntitys
    {
        #region BinParamter Members

        void BinInsert(SqlCommand cmd);
        void BinUpdate(SqlCommand cmd);
        void BinByWhere(SqlCommand cmd);
        void BinDelete(SqlCommand cmd);
        
        #endregion

        #region Method IBaseEntitys

        DataTable GetByAll();
        DataTable GetByWhere(IBaseEntitys ibe);
        int Insert(IBaseEntitys ibe);
        int Update(IBaseEntitys ibe);
        int Delete(IBaseEntitys ibe);

        #endregion
    }
}
