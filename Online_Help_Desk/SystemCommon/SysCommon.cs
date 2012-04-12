using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web; 
using System.Xml.Linq;
using Captcha; 
using SystemCommon;
using System.Web.UI.WebControls;
using System.Drawing.Imaging;
using System.Resources;
using System.Threading;
using System.Globalization;

namespace SystemCommon
{
    public class SysCommon
    {
        public const string USER_ID = "USER_ID";

        public static void LoadCaptcha(Image img)
        {
            try
            {
                CaptchaImage cImage = new CaptchaImage(CaptchaImage.generateRandomCode(), 140, 40);
                cImage.Image.Save(HttpContext.Current.Server.MapPath("~\\Images\\Captcha\\" + Convert.ToString(HttpContext.Current.Session["CaptchaCode"]) + ".jpg"), ImageFormat.Jpeg);
                img.ImageUrl = "~\\Images\\Captcha\\" + Convert.ToString(HttpContext.Current.Session["CaptchaCode"]) + ".jpg";
                cImage.Dispose();
            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadCaptcha", ex.Message);
            }
        }
        public static int GetUserIDFromSession()
        {
            if (HttpContext.Current.Session[USER_ID] != null)
                return int.Parse(HttpUtility.UrlDecode(HttpContext.Current.Session[USER_ID].ToString()));
            else
                return 0;
        }
        public static void SetUserIDToSession(int iDUser)
        {
            
        }

        public static int GetUserIDFromCookie()
        {
            if (HttpContext.Current.Request.Cookies[USER_ID] != null)
                return int.Parse(HttpUtility.UrlDecode(HttpContext.Current.Request.Cookies[USER_ID].Value));
            else
                return 0;
        }

        public static void SetUserIDToCookie(int iDUser)
        {
            System.Web.HttpContext.Current.Response.Cookies.Add(new HttpCookie(USER_ID, iDUser.ToString()));
        }
        public static string GetTextLang(string textkey)
        {
            ResourceManager rm;
            string cultureCode = "";
            rm = new ResourceManager("Resources.Strings", System.Reflection.Assembly.Load("App_GlobalResources"));
            cultureCode = GetLanguage();
            Thread.CurrentThread.CurrentCulture = new CultureInfo(cultureCode);
            return rm.GetString(textkey, Thread.CurrentThread.CurrentCulture);
        }

        public static void SetLanguage(string cultureCode)
        {
            HttpContext context = HttpContext.Current;
            HttpCookie cookieLang;
            cookieLang = new HttpCookie("AppCookie", cultureCode);
            cookieLang.Expires = DateTime.Now.AddYears(100);
            context.Response.Cookies.Add(cookieLang);
        }

        public static string GetLanguage()
        {

            string strOutput = String.Empty;
            if (HttpContext.Current.Request.Cookies["AppCookie"] != null)
            {
                if (HttpContext.Current.Request.Cookies["AppCookie"].Value != string.Empty)
                    strOutput = HttpContext.Current.Request.Cookies["AppCookie"].Value;
                else
                {
                    SetLanguage(GetDefaultLanguage());
                    strOutput = GetDefaultLanguage();
                }
            }
            else
            {
                SetLanguage(GetDefaultLanguage());
                strOutput = GetDefaultLanguage();
            }
            return strOutput;
        }
        private static string GetDefaultLanguage()
        {
            string strLanguage = "en-US";
            return strLanguage;
        }
    }
}
