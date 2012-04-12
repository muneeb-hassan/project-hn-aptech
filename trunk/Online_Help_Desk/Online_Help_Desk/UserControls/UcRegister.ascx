<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcRegister.ascx.cs"
    Inherits="Online_Help_Desk.UserControls.UcRegister" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="PopupRegister" style="opacity: 1.5;">
    <div class="title-left">
        <asp:Label ID="lbRegister" runat="server" Text="Form Register"></asp:Label></div>
    <span class="title-right" onclick="return ClosePopup()">
    <asp:ImageButton OnClientClick="return ClosePopup();" 
        ImageUrl="~/Images/png_remove.png" ID="imgClose" runat="server" 
        onclick="imgClose_Click" /></span>
    <div id="Popup-content">
        <table style="width: 100%;">
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbUserName" runat="server" Text="UserName"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtRgUserName" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbGender" runat="server" Text="Gender"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:RadioButton ID="rdbMale" GroupName="rdb1" runat="server" Text="Male " Checked="true" />
                    <asp:RadioButton ID="rdbFemale" GroupName="rdb1" runat="server" Text="FeMale " />
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtRgPass" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbrePass" runat="server" Text="Re-Password"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtRePass" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbFirstName" runat="server" Text="FirstName"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFristName" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbEmail" runat="server" Text="Email"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbTelephone" runat="server" Text="Telephone"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtTelephone" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbAddress" runat="server" Text="Address"></asp:Label> : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtAddress" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">
                        <asp:Label ID="lbSafeCode" runat="server" Text="Safe Code"></asp:Label> : </span>
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
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 50px;">
                <td>
                </td>
                <td>
                    <asp:Button ID="btnRegister" runat="server" Text=" Register " CssClass="button-Popup"
                        OnClick="btnRegister_Click" />
                        <asp:Button ID="btnClear" runat="server" Text=" Clear " CssClass="button-Popup"
                        OnClick="btnClear_Click" />
                    <%--<input type="submit" class="button-Popup" id="btnClear" value=" Clear " onclick="return ClearForm();" />--%>
                </td>
                <td>
                </td>
            </tr> 
        </table>
    </div>
</div>
