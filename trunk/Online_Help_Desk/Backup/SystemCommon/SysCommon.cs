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
                cImage.Image.Save(HttpContext.Current.Server.MapPath("~\\Images\\" + Convert.ToString(HttpContext.Current.Session["CaptchaCode"]) + ".jpg"), ImageFormat.Jpeg);
                img.ImageUrl = "~\\Images\\" + Convert.ToString(HttpContext.Current.Session["CaptchaCode"]) + ".jpg";
                cImage.Dispose();
            }
            catch (Exception ex)
            {
                LogError.LogMessage("LoadCaptcha", ex.Message);
            }
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
    }
}
