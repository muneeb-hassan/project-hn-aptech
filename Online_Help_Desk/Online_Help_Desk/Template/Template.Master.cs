using System;
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
using DataAcesss.Entitys;

namespace Online_Help_Desk
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
                LoadPermission();
            }
        }

        private void LoadPermission()
        {
            try
            {
                if (_userId == 0)
                {
                    Response.Redirect("../FrmLogin.aspx", false);
                }
                else
                {
                    Users users = new Users();
                    users.UserID = _userId;
                    users.strWhere = "UserID = " + _userId;
                    DataTable dtUsers = UsersBO.GetByWhere(users);
                    if (dtUsers.Rows.Count > 0)
                    {
                        for (int i = 0; i < dtUsers.Rows.Count; i++)
                        {
                            int RoleId = Convert.ToInt32(dtUsers.Rows[i]["RoleID"]);
                            Roless roles = new Roless();
                            roles.RoleID = RoleId;
                            roles.strWhere = "RoleID = " + RoleId;

                            DataTable dtRoles = RolesBO.getByWhere(roles);
                            if (dtRoles.Rows.Count > 0)
                            {
                                string roleName = dtRoles.Rows[0]["RoleName"].ToString();
                                if (roleName.ToLower().Equals(Permission.Facility_Heads))
                                {

                                }
                                else if (roleName.ToLower().Equals(Permission.Assignees))
                                {
                                    
                                }
                                else
                                {
                                   
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("", ex.Message);
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
                    users.strWhere = "UserID = " + _userId;
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
                Response.Redirect("~/FrmLogin.aspx", false);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("lbLogOut_Click", ex.Message);
            }
        }

        protected void lbtUserName_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/SystemForm/ChangeUsers.aspx", false);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("", ex.Message);
            }
        }

        protected void lbtChangeUsers_Click(object sender, EventArgs e)
        {

        }

        protected void lbHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SystemForm/Requests.aspx", false);
        }
    }
}
