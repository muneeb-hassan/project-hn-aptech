<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Template.Master" CodeBehind="ChangeUsers.aspx.cs" Inherits="Online_Help_Desk.ChangeUsers" Title="...:: Change Information ::.." %>
<%@ Register src="~/UserControls/UcChangeUsers.ascx" tagname="UcChangeUsers" tagprefix="uc1" %>
<asp:Content ID="content" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <uc1:UcChangeUsers ID="UcChangeUsers1" runat="server" />
</asp:Content>