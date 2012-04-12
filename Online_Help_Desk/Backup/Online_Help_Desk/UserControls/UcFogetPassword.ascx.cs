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
using SystemCommon;
using System.Net.Mail;
using BusinessRules;

namespace Online_Help_Desk.UserControls
{
    public partial class UcFogetPassword : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SysCommon.LoadCaptcha(ImgCaptcha);
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                string strCaptcha = Convert.ToString(Session["CaptchaCode"]);

                if (strCaptcha.ToLower().Equals(txtCaptra.Text))
                {
                    SendMail_Thankyou();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.Message_IncorrectCaptcha + "');</script>");
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("btnSend_Click", ex.Message);
            }
        }
        private string CheckExistEmail(string toEmail)
        {
            string userName = string.Empty;
            int j = 0;
            try
            {
                DataTable dtUsers = UsersBO.GetByAll();
                if (dtUsers.Rows.Count > 0)
                {
                    for (int i = 0; i < dtUsers.Rows.Count; i++)
                    { 
                        string email = dtUsers.Rows[i]["Email"].ToString();
                        if (email.ToLower().Equals(toEmail.ToLower()))
                        {
                            j += 1;
                            userName = dtUsers.Rows[i]["UserName"].ToString();
                        }
                    }
                }
                else
                {
                    return string.Empty;
                }
                if (j < 0)
                {
                    return string.Empty;
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("", ex.Message);
            }
            return userName;
        }
        private void SendMail_Thankyou()
        {
            try
            {
                string fromEmail = "your_email_address@gmail.com";
                string toEmail = txtEmail.Text;
                string UserName = string.Empty;
                
                MailMessage mail = new MailMessage(fromEmail, toEmail);
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                mail.Subject = "Reset new Password OnLine_Help_Desk";
                mail.Body = "Hi Users : "+ UserName + " you are Reset New Password in Online Help Desk System <br/> Password : "+ txtPassword.Text;

                SmtpServer.Port = 587;
                SmtpServer.Credentials = new System.Net.NetworkCredential("Online_Help_Desk@gmail.com", "123Ok");
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("SendMail_Thankyou", ex.Message);
            }
        }

        protected void imgClose_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/FrmLogin.aspx");
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            try
            {
                SysCommon.LoadCaptcha(ImgCaptcha);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("btnRefresh_Click", ex.Message);
            }
        }
    }
}