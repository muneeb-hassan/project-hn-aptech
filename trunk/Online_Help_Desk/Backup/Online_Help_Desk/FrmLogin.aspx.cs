using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Resources;
using System.Reflection;
using System.Globalization;
using System.Threading; 

namespace Online_Help_Desk
{
    public partial class FrmLogin : System.Web.UI.Page
    {
        private ResourceManager rm;

        protected void Page_Load(object sender, EventArgs e)
        {
            //rm = new ResourceManager("Resources.Strings", System.Reflection.Assembly.Load("App_GlobalResources"));
            //lblWelcome.Text = CommonFunc.GetTextLang("Wellcome");
            object o = Request["c"];
            if (o != null)
            {
                int ID = Convert.ToInt32(o);
                if (ID == 1)
                {
                    Control ct = Page.LoadControl("UserControls/UcRegister.ascx");
                    plhdContent.Controls.Add(ct);
                }
                else if (ID == 2)
                {
                    Control ct = Page.LoadControl("UserControls/UcFogetPassword.ascx");
                    plhdContent.Controls.Add(ct);
                }
            }
            else
            {
                Control ct = Page.LoadControl("UserControls/UCLogin.ascx");
                plhdContent.Controls.Add(ct);
            }
        }

        protected void ibtVN_Click(object sender, ImageClickEventArgs e)
        {
            //Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
            //SystemEnv.SetLanguage("vi-VN");
            //lblWelcome.Text = rm.GetString("Wellcome", Thread.CurrentThread.CurrentCulture);
            //string curUrl = Request.RawUrl;
            //Response.Redirect(curUrl, false);
        }

        protected void ibtEN_Click(object sender, ImageClickEventArgs e)
        {
            //Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            //SystemEnv.SetLanguage("en-US");
            //lblWelcome.Text = rm.GetString("Wellcome", Thread.CurrentThread.CurrentCulture);
            //string curUrl = Request.RawUrl;
            //Response.Redirect(curUrl, false);
        }

    }
}
