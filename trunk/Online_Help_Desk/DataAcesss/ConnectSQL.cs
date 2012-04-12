using System;
using DataAccess.Entitys;
using System.Data.SqlClient;
using System.Data;
using SystemCommon;

namespace DataAccess
{
    public class ConnectSQL
    {
        private static SqlConnection cn;
        private void Connect()
        {
            string strCn = SystemCommon.SysConfig.strConfig();
            cn = new SqlConnection(strCn);
        }

        public static void Bindings(string parameter, object value, SqlCommand cmd)
        {
            if (cmd.CommandText.ToUpper().Equals(""))
                return;
            cmd.Parameters.AddWithValue(parameter, value);
        }
        public DataTable Select(string script, IBaseEntitys ibe)
        {
            try
            {
                OpenCn();
                SqlCommand cmd = new SqlCommand(script, cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                return dt;
            }
            finally { CloseCn(); }
        }
        public SqlCommand SelectbyParameter(string script, IBaseEntitys ibe)
        {
            try
            {
                OpenCn();
                SqlCommand cmd = new SqlCommand(script, cn);
                cmd.CommandType = CommandType.StoredProcedure;

                return cmd;
            }
            finally { CloseCn(); }
        }
        public DataTable SelectByWhere(string script, IBaseEntitys ibe)
        {
            DataTable dt = new DataTable();
            try
            {
                OpenCn();
                SqlCommand cmd = new SqlCommand(script, cn);
                cmd.CommandType = CommandType.StoredProcedure;
                ibe.BinByWhere(cmd);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);

            }
            catch (Exception ex)
            {
                LogError.LogMessage("SelectByWhere", ex.Message);
            }
            finally { CloseCn(); }
            return dt;
        }

        public int Insert(string script, IBaseEntitys ibe)
        {
            int i = 0;
            try
            {
                OpenCn();
                SqlCommand cmd = new SqlCommand(script, cn);
                cmd.CommandType = CommandType.StoredProcedure;
                ibe.BinInsert(cmd);

                i = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                LogError.LogMessage("Insert()", ex.Message);
            }
            finally { CloseCn(); }
            return i;
        }

        public SqlCommand ExecuteQuery(string script, IBaseEntitys ibe)
        {
            OpenCn();
            SqlCommand cmd = new SqlCommand(script, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            return cmd;
        }
 
        private void OpenCn()
        {
            if (cn == null)
                Connect();
            if (cn.State == ConnectionState.Closed)
                cn.Open();
        }
        public void CloseCn()
        {
            if (cn != null)
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
        }
    }
}
