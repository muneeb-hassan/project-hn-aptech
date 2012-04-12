<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcFogetPassword.ascx.cs"
    Inherits="Online_Help_Desk.UserControls.UcFogetPassword" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="PopupRegister" style="opacity: 1.5;">
    <div class="title-left">
        Form Register</div>
    <span class="title-right" onclick="return ClosePopup()">
        <asp:ImageButton OnClientClick="return ClosePopup();" ImageUrl="~/Images/png_remove.png"
            ID="imgClose" runat="server" OnClick="imgClose_Click" /></span>
    <div id="Popup-content">
        <table style="width: 100%;">
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Enter UserName : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtUserName" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Enter Email : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Enter Re-Email : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtReEmail" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">NewPassword : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtPassword" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Safe Code : </span>
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="pnUpdate" runat="server">
                        <ContentTemplate>
                             <div style="width :50%;float :left;">
                                 <asp:Image ID="ImgCaptcha" runat="server" />
                              </div>
                              <div style="width :49%;float :left;">
                                 <asp:Button ID="btnRefresh" runat="server" CssClass="Refresh button-Popup" Text=""
                                    OnClick="btnRefresh_Click" />
                              </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                </td>
                <td align="left">
                    <asp:TextBox ID="txtCaptra" runat="server" Width="178px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 50px;">
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSend" runat="server" Text=" Send " CssClass="button-Popup" OnClick="btnSend_Click" />
                    <input type="submit" class="button-Popup" id="btnClear" value=" Clear " onclick="return ClearForm();" />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</div>
