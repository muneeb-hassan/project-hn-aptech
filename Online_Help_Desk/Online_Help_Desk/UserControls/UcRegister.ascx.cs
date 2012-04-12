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
using DataAccess.Entitys;
using BusinessRules;
using SystemCommon;
using Captcha;
using System.Drawing.Imaging;

namespace Online_Help_Desk.UserControls
{
    public partial class UcRegister : System.Web.UI.UserControl
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
                lbRegister.Text = SysCommon.GetTextLang("FormRegister");
                lbUserName.Text = SysCommon.GetTextLang("Username");
                lbPassword.Text = SysCommon.GetTextLang("Password");
                lbEmail.Text = SysCommon.GetTextLang("Email");
                lbGender.Text = SysCommon.GetTextLang("Gender");
                rdbMale.Text = SysCommon.GetTextLang("Male");
                rdbFemale.Text = SysCommon.GetTextLang("FeMale");
                lbSafeCode.Text = SysCommon.GetTextLang("SafeCode");
                lbrePass.Text = SysCommon.GetTextLang("RePassword");
                lbFirstName.Text = SysCommon.GetTextLang("FirstName");
                lbTelephone.Text = SysCommon.GetTextLang("Telephone");
                lbAddress.Text = SysCommon.GetTextLang("Address");
                btnRegister.Text = SysCommon.GetTextLang("Register");
                btnClear.Text = SysCommon.GetTextLang("Clear");
            }
            catch (Exception ex)
            {
                LogError.LogMessage("",ex.Message);
            }
        }
        private bool validate_Insert()
        {
            return true;
        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                string strCaptcha = Convert.ToString(Session["CaptchaCode"]);

                if (strCaptcha.ToLower().Equals(txtCaptra.Text))
                {
                    string userName = txtRgUserName.Text;
                    string firstName = txtFristName.Text;
                    string password = txtRgPass.Text;
                    string Email = txtEmail.Text;
                    string Telephone = txtTelephone.Text;
                    string Address = txtAddress.Text;

                    //Check UserName has in System
                    DataTable dtUsers = UsersBO.GetByAll();
                    if (dtUsers.Rows.Count > 0)
                    {
                        for (int j  = 0; j < dtUsers.Rows.Count; j++)
                        {
                            string uName = dtUsers.Rows[j]["UserName"].ToString();
                            if (userName.ToLower().Equals(uName.ToLower()))
                            {
                                if (SysCommon.GetLanguage() == "vi-VN")
                                {
                                    Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + uName + " " + SysMessage.Users_Message_ExistVN + "');</script>");
                                }else
                                    Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + uName + " " + SysMessage.Users_Message_ExistEng + "');</script>");
                                txtRgUserName.Focus();
                                return;
                            }
                        }
                    }

                    Users user = new Users();
                    user.UserName = userName;
                    user.PassWord = password;
                    if (rdbMale.Checked)
                    {
                        user.Gender = true;
                    }
                    else
                        user.Gender = false;
                    user.RegisterDate = DateTime.Now;
                    user.FirstName = firstName;
                    user.Email = Email;
                    user.PhoneNumber = Telephone;
                    user.Address = Address;
                    user.Status = true;
                    
                    int i = UsersBO.Insert(user);
                    if (i > 0)
                    {
                        if (SysCommon.GetLanguage() == "vi-VN")
                        {
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.Users_Message_InsertSucessVN + "');</script>");
                        }else
                            Page.ClientScript.RegisterStartupScript(typeof(Page), "SucessFull", "<script>alert('" + SysMessage.Users_Message_InsertSucessEng + "');</script>");
                    }
                }
                else
                {
                    if (SysCommon.GetLanguage() == "vi-VN")
                    {
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "Alert", "<script>alert('" + SysMessage.Message_IncorrectCaptchaVN + "');</script>");
                        txtCaptra.Focus();
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(typeof(Page), "Alert", "<script>alert('" + SysMessage.Message_IncorrectCaptchaEng + "');</script>");
                        txtCaptra.Focus();
                    }
                }

            }
            catch (Exception ex)
            {
                LogError.LogMessage("btnRegister_Click", ex.Message);
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (Control c in Controls)
                {
                    if (c is TextBox)
                        ((TextBox)c).Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                LogError.LogMessage("btnClear_Click", ex.Message);
            }
        }
    }
}