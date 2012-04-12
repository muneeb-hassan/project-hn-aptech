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
using DataAccess.Entitys;
using System.Collections.Generic;

namespace Online_Help_Desk.Admin.UserControls
{
    public partial class UcFogetPassword : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SysCommon.LoadCaptcha(ImgCaptcha);
                DisplayLanguage();
            }
        }

        private void DisplayLanguage()
        {
            try
            {
                lbUserName.Text = SysCommon.GetTextLang("Username");
                lbNewPass.Text = SysCommon.GetTextLang("NewPassword");
                lbReMail.Text = SysCommon.GetTextLang("ReEmail");
                lbEmail.Text = SysCommon.GetTextLang("Email");
                lbforget.Text = SysCommon.GetTextLang("ForgetPassword");
                lbSafeCode.Text = SysCommon.GetTextLang("SafeCode");
                btnSend.Text = SysCommon.GetTextLang("send");
                btnClear.Text = SysCommon.GetTextLang("Clear");
            }
            catch (Exception ex)
            {
                LogError.LogMessage("DisplayLanguage", ex.Message);
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                string strCaptcha = Convert.ToString(Session["CaptchaCode"]);

                if (strCaptcha.ToLower().Equals(txtCaptra.Text))
                {
                    if (SendMail_Thankyou())
                    {
                        string toEmail = txtEmail.Text;
                        string Name = txtUserName.Text;
                        List<Users> listUsers = CheckExistEmail(toEmail, Name);
                        Users users = (Users)listUsers[0];
                        int i = UsersBO.Update(users);
                        if (SysCommon.GetLanguage() == "vi-VN")
                        {
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.SendEmail_Message_OKVN + "');</script>");
                        }
                        else
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.SendEmail_Message_OKEng + "');</script>");
                    }
                    else
                    {
                        if (SysCommon.GetLanguage() == "vi-VN")
                        {
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "Send fail", "<script>alert('" + SysMessage.SendEmail_Message_FailVN + "');</script>");
                        }else
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "Send fail", "<script>alert('" + SysMessage.SendEmail_Message_FailEng + "');</script>");
                    }
                }
                else
                {
                    if (SysCommon.GetLanguage() == "vi-VN")
                    {
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.Message_IncorrectCaptchaVN + "');</script>");
                    }else
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.Message_IncorrectCaptchaEng + "');</script>");
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("btnSend_Click", ex.Message);
            }
        }
        private List<Users> CheckExistEmail(string toEmail,string UserName)
        {
            List<Users> listUsers = new List<Users>();
            int j = 0;
            try
            {
                DataTable dtUsers = UsersBO.GetByAll();
                if (dtUsers.Rows.Count > 0)
                {
                    for (int i = 0; i < dtUsers.Rows.Count; i++)
                    {
                        Users users = new Users();
                        int userID = Convert.ToInt32(dtUsers.Rows[i]["UserID"]); 
                        string email = dtUsers.Rows[i]["Email"].ToString();
                        string uName = dtUsers.Rows[i]["UserName"].ToString(); 
                        bool gender = Convert.ToBoolean(dtUsers.Rows[i]["Gender"]);
                        string address = dtUsers.Rows[i]["Address"].ToString();
                        string telephone = dtUsers.Rows[i]["PhoneNumber"].ToString();
                        string firstName = dtUsers.Rows[i]["FirstName"].ToString();
                        string lastdate = dtUsers.Rows[i]["LastDate"].ToString();
                        DateTime dateRegister = Convert.ToDateTime(dtUsers.Rows[i]["RegisterDate"]);
                        bool status = Convert.ToBoolean(dtUsers.Rows[i]["Status"]);

                        if (email.ToLower().Equals(toEmail.ToLower()) && UserName.ToLower().Equals(uName.ToLower()))
                        {
                            j += 1;
                            users.UserID = userID;
                            users.UserName = uName;
                            users.PassWord = txtPassword.Text;
                            users.FirstName = firstName;
                            users.Gender = gender;
                            users.Email = email;
                            users.RegisterDate = dateRegister;
                            users.LastName = lastdate;
                            users.Status = status;
                            users.PhoneNumber = telephone;
                            users.Address = address;

                            listUsers.Add(users);
                        }
                    }
                }
                else
                {
                    return null;
                }
                if (j < 0)
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("", ex.Message);
            }
            return listUsers;
        }
        private bool SendMail_Thankyou()
        {
            try
            {
                string fromEmail = SysMessage.SendEmail_Message_From;
                string toEmail = txtEmail.Text;
                string Name = txtUserName.Text;

                List<Users> listUser = CheckExistEmail(toEmail,Name);
                if (listUser.Count == null || listUser.Count == 0)
                {
                    return false;
                }
                Users user = (Users)listUser[0];
                MailMessage mail = new MailMessage(fromEmail, toEmail);
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");

                if (SysCommon.GetLanguage() == "vi-VN")
                {
                    mail.Subject = SysMessage.SendEmail_Message_SubjectVN;
                    mail.Body = "Xin chào Users : " + user.UserName + SysMessage.SendEmail_Message_ContentVN + txtPassword.Text;
                }
                else
                {
                    mail.Subject = SysMessage.SendEmail_Message_SubjectEng;
                    mail.Body = "Hi Users : " + user.UserName + SysMessage.SendEmail_Message_ContentEng + txtPassword.Text;
                }
                SmtpServer.Credentials = new System.Net.NetworkCredential(SysMessage.SendEmail_Message_UserName, SysMessage.SendEmail_Message_Password);
                SmtpServer.Port = 587;
                SmtpServer.EnableSsl = true;

                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                LogError.LogMessage("SendMail_Thankyou", ex.Message);
            }
            return true;
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