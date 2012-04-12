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
using System.Xml.Linq;
using BusinessRules;
using SystemCommon;
using System.Web.UI.MobileControls;
using System.Collections.Generic;
using DataAccess.Entitys;
using Captcha;
using System.Drawing.Imaging;

namespace Online_Help_Desk.UserControls
{
    public partial class UCLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        

        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = txtUserName.Text;
                string password = txtPassword.Text;
                List<Users> listUsers = UsersBO.CheckLogin(userName, password);
                if (listUsers.Count > 0)
                {
                    Users u = (Users)listUsers[0];
                    int userId = Convert.ToInt32(u.UserID);
                    SysCommon.SetUserIDToCookie(userId);
                    Response.Redirect("~/Default.aspx",false);
                }
                else
                {
                    lblMessage.Visible = true;
                    lblMessage.Text = SystemCommon.SysMessage.Users_Message_LoginFail;
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("btnLogIn_Click", ex.Message);
            }
        } 
        protected void lbtRegister_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/FrmLogin.aspx?c=" + 1);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("lbtRegister_Click", ex.Message);
            }
        }
  
        protected void lbtForgetPass_Click(object sender, EventArgs e)
        {
            try{
                Response.Redirect("~/FrmLogin.aspx?c=" + 2);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("lbtForgetPass_Click", ex.Message);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtPassword.Text = "";
        }
    }
}