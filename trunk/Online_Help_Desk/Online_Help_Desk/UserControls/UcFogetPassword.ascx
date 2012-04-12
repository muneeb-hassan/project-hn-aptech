<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcFogetPassword.ascx.cs"
    Inherits="Online_Help_Desk.UserControls.UcFogetPassword" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="PopupRegister" style="opacity: 1.5;">
    <div class="title-left">
        <asp:Label ID="lbforget" runat="server" Text="Forget Password"></asp:Label>
    </div>
    <span class="title-right" onclick="return ClosePopup()">
        <asp:ImageButton OnClientClick="return ClosePopup();" ImageUrl="~/Images/png_remove.png"
            ID="imgClose" runat="server" OnClick="imgClose_Click" /></span>
    <div id="Popup-content">
        <table style="width: 100%;">
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;"><asp:Label ID="lbUserName" runat="server" Text="UserName "></asp:Label> :</span></td>
                <td align="left">
                    <asp:TextBox ID="txtUserName" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;"><asp:Label ID="lbEmail" runat="server" Text="Email "></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;"><asp:Label ID="lbReMail" runat="server" Text="Re-Email"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtReEmail" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;"><asp:Label ID="lbNewPass" runat="server" Text="New Password"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtPassword" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;"><asp:Label ID="lbSafeCode" runat="server" Text="Safe Code"></asp:Label> : </span>
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
                    <asp:Button ID="btnClear" runat="server" Text=" Clear " CssClass="button-Popup" OnClientClick="return ClearForm();" />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</div>
