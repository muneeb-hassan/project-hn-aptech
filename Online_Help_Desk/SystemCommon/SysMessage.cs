using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SystemCommon
{
    public class SysMessage
    {
        //                  INFOMATION  MESSAGE USERS ENGLISH
        public const string Users_Message_LoginSuccessEng      = "Login SuccessFull..!";
        public const string Users_Message_LoginFailEng         = "Login Fail..!";
        public const string Users_Message_InsertSucessEng      = "You are Insert Success..!";
        public const string Users_Message_ExistEng             = " has Exist in System,Please Choice re-Input Account..!";
        public const string Message_IncorrectCaptchaEng        = "You entered incorrect Captcha Code!";

        //                  INFOMATION  MESSAGE USERS VIETNAMESE
        public const string Users_Message_LoginSuccessVN       = "Đăng nhập thành công..!";
        public const string Users_Message_LoginFailVN          = "Đăng nhập thất bại..!";
        public const string Users_Message_InsertSucessVN       = "lưu dữ liệu thành công..!";
        public const string Users_Message_ExistVN              = " đã tồn tại trong hệ thống,xin vui lòng nhập tài khoản khác..!";
        public const string Message_IncorrectCaptchaVN         = "nhập sai mã bảo vệ,vui lòng nhập lại!";

        //                   INFOMATION  MESSAGE SEND EMAIL ENGLISH
        public const string SendEmail_Message_UserName         = "c0908m@gmail.com";
        public const string SendEmail_Message_Password         = "c0908m2010";
        public const string SendEmail_Message_From             = "c0908m@gmail.com";
        public const string SendEmail_Message_SubjectEng       = "Reset new Password OnLine_Help_Desk";
        public const string SendEmail_Message_OKEng            = "Password is send Successfull in your Email,Please Check Email...! ";
        public const string SendEmail_Message_FailEng          = "Send Email Fail,Please Check Information..!";
        public const string SendEmail_Message_ContentEng       = "you are Reset New Password in Online Help Desk System new Password is ";

        //                    INFOMATION  MESSAGE SEND EMAIL VIETNAMESE
        public const string SendEmail_Message_SubjectVN        = "cài đặt lại mật khẩu mới tại hệ thống quản lý Online Help Desk";
        public const string SendEmail_Message_OKVN             = "Mật khẩu đã được gửi thành công vào hộp thư của bạn,vui lòng kiểm tra Email..! ";
        public const string SendEmail_Message_FailVN           = "Gửi Email thất bại,xin vui lòng kiểm tra lại thông tin..!";
        public const string SendEmail_Message_ContentVN        = "bạn đã cài đặt lại mật khẩu mới tại hệ thống quản lý Online Help Desk,Mật khẩu mới của bạn là : ";
    }
}
