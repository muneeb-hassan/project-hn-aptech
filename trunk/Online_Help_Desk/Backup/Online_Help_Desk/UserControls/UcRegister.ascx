<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcRegister.ascx.cs"
    Inherits="Online_Help_Desk.UserControls.UcRegister" %>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<div id="PopupRegister" style="opacity: 1.5;">
    <div class="title-left">
        Form Register</div>
    <span class="title-right" onclick="return ClosePopup()">
    <asp:ImageButton OnClientClick="return ClosePopup();" 
        ImageUrl="~/Images/png_remove.png" ID="imgClose" runat="server" 
        onclick="imgClose_Click" /></span>
    <div id="Popup-content">
        <table style="width: 100%;">
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">UserName : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtRgUserName" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Gender : </span>
                </td>
                <td align="left">
                    <asp:RadioButton ID="rdbMale" GroupName="rdb1" runat="server" Text="Male " Checked="true" />
                    <asp:RadioButton ID="rdbFemale" GroupName="rdb1" runat="server" Text="FeMale " />
                </td>
                <td></td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Password : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtRgPass" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Re-Password : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtRePass" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">FirstName : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtFristName" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Email : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtEmail" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Telephone : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtTelephone" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr style="height: 30px;">
                <td align="right">
                    <span style="margin-right: 15px;">Address : </span>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtAddress" runat="server" Width="230px" Height="23px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
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
