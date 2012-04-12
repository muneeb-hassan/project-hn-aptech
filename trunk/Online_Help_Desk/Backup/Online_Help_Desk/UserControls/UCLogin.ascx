<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLogin.ascx.cs" Inherits="Online_Help_Desk.UserControls.UCLogin" %>

<script language="javascript" type="text/javascript">
    function CheckValidateLogin() {

        var objUserName = document.getElementById("<%=txtUserName.ClientID %>");
        var objPassword = document.getElementById("<%=txtPassword.ClientID %>"); 
           
        if (isBlank(objUserName.value)) {
            alert(objName);
            objUserName.select();
            objUserName.focus();
            return false;
        }

        if (isBlank(objPassword.value)) {
            alert(objPass);
            objPassword.select();
            objPassword.focus();
            return false;
        }
        return true;
    }

</script>

<table align="center" border="0" width="389" cellspacing="0" cellpadding="0">
    <tr>
        <td width="44">
            <img src="../Images/login/login_03.gif" border="0">
        </td>
        <td background="../Images/login/login_06.gif" valign="top">
            <table class="font" border="0" width="100%" id="table2" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="13%" valign="top">
                        <img src="../Images/login/login_07.gif">
                    </td>
                    <td valign="top">
                        &nbsp;
                    </td>
                    <td width="13%" valign="top">
                        <img src="../Images/login/login_07.gif">
                    </td>
                </tr>
                <tr>
                    <td colspan="3" valign="top" align="center">
                        <img src="../Images/login/login_10.gif" align="left" hspace="5">
                        <h3 style="text-align :center; padding-right :55px;">
                            <asp:Label ID="lblTitle" runat="server" Text="LOGIN"></asp:Label>
                        </h3>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" valign="top">
                        <table border="0" width="100%" cellpadding="0">
                            <tr>
                                <td align="right" width="37%">
                                    <label style="width: 142px">
                                        <font color="red">*</font>
                                        <asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label>
                                    </label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUserName" runat="server" Text="" TabIndex="1" Width="160px" Height="23px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    <label style="width: 142px">
                                        <font color="red">*</font>
                                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                                    </label>
                                </td>
                                <td class="style2">
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" TabIndex="2" Text=""
                                        Width="160px" Height="23px" MaxLength="50"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                </td>
                                <td align="left">
                                    <asp:Button ID="btnLogIn" runat="server" TabIndex="3" Text=" Login " CssClass="button-Popup fixbtnLogin" OnClientClick="return CheckValidateLogin();"
                                        OnClick="btnLogIn_Click" /> 
                                    <asp:Button ID="btnClear" runat="server" Text="Clear"  
                                        CssClass="button-Popup fixbtnLogin" onclick="btnClear_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" height="10" align="center">
                                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:LinkButton ID="lbtForgetPass" runat="server" onclick="lbtForgetPass_Click">Forget Password</asp:LinkButton>
                                </td>
                                <td height="10" align="right">
                                    <asp:LinkButton ID="lbtRegister" runat="server" onclick="lbtRegister_Click">Register</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        <td width="37">
            <img src="../Images/login/login_08.gif" alt="" border="0">
        </td>
    </tr>
</table> 
