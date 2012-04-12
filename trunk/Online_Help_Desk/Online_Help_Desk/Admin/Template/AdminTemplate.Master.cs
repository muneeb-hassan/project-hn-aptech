﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using SystemCommon;
using BusinessRules;
using DataAccess.Entitys;

namespace Online_Help_Desk.Admin
{
    public partial class Template : System.Web.UI.MasterPage
    {
        private int _userId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {  
            if (!IsPostBack)
            {
                lbDate.Text = "Hôm nay, " + GetDayOfDateVN(DateTime.Now) + " Ngày : " + DateTime.Now.ToString("dd-MM-yyyy");
                LoadUserName();
                LoadControls();
            }
        }
         
        private void LoadControls()
        {
            try
            {
                object obj = Request["ctl"];
                Control ct = null;
                if (obj != null)
                {
                    string strControls = obj.ToString();
                    ct = Page.LoadControl("Admin/UserControls/UcChangeUsers.ascx");
                    plhdContent.Controls.Add(ct);
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadControls", ex.Message);
            }
        }

        private void LoadUserName()
        {
            try
            {
                int obj = SysCommon.GetUserIDFromCookie();
                if (obj != 0)
                {
                    _userId = Convert.ToInt32(obj);
                    Users users = new Users();
                    users.UserID = _userId;
                    users.strWhere = "UserID = "+ _userId;
                    DataTable dtUsers = UsersBO.GetByWhere(users);
                    
                    if (dtUsers.Rows.Count > 0)
                    {
                        lbtUserName.Text = dtUsers.Rows[0]["UserName"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadUserName", ex.Message);
            }
        }

        private static string GetDayOfDateVN(DateTime dvalue)
        {
            try
            {

                switch (dvalue.DayOfWeek)
                {
                    case DayOfWeek.Monday:
                        return "Thứ hai";
                    case DayOfWeek.Tuesday:
                        return "Thứ ba";
                    case DayOfWeek.Wednesday:
                        return "Thứ tư";
                    case DayOfWeek.Thursday:
                        return "Thứ năm";
                    case DayOfWeek.Friday:
                        return "Thứ sáu";
                    case DayOfWeek.Saturday:
                        return "Thứ bảy";
                    case DayOfWeek.Sunday:
                        return "chủ nhật";
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("GetDayOfDateVN", ex.Message);
            }
            return dvalue.DayOfWeek.ToString();
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Admin/FrmLogin.aspx", false);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("lbLogOut_Click", ex.Message);
            }
        }

        protected void lbtChangeUsers_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Admin/Default.aspx?ctl=1", false);
            }catch(Exception ex)
            {
                LogError.LogMessage("", ex.Message);
            }
        }
        protected void lbtUserName_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("/Admin/ChangeUsers.aspx", false);
            }catch(Exception ex)
            {
                LogError.LogMessage("", ex.Message);
            }
        }
    }
}