<%@ Page Language="C#" MasterPageFile="~/Template/Template.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Help_Desk._Default" Title="..:: Online_Help_Desk ::.." %>
<%@ Register src="UserControls/mainStart.ascx" tagname="mainStart" tagprefix="uc1" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <uc1:mainStart ID="mainStart1" runat="server" />
</asp:Content>