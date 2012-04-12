<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmLogin.aspx.cs" Inherits="Online_Help_Desk.FrmLogin" Title="...:: Online_Help_Desk ::..." %>

<%@ Register Src="~/UserControls/UCLogin.ascx" TagName="Login" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="Css/Login.css" rel="stylesheet" type="text/css" />
    <script src="Js/function.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td style="width: 80%">
                    <asp:Label ID="lblWelcome" runat="server" Text="Phần mềm quản lý Cơ sở vật chất"></asp:Label>
                </td>
                <td>
                    <asp:ImageButton ID="ibtVN" runat="server" AlternateText="VietNam" ImageUrl="~/Images/vi.gif"
                        OnClick="ibtVN_Click" />&nbsp;
                    <asp:ImageButton ID="ibtEN" runat="server" AlternateText="English" ImageUrl="~/Images/en.gif"
                        OnClick="ibtEN_Click" />&nbsp;
                </td>
            </tr>
        </table>
    </div>
    <asp:PlaceHolder ID="plhdContent" runat="server"></asp:PlaceHolder>
    </form>
</body>
</html>
