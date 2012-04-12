<%@ Page Language="C#" MasterPageFile="~/Admin/Template/AdminTemplate.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Help_Desk.Admin._Default" Title="..:: Online_Help_Desk ::.." %>
<%@ Register src="~/Admin/UserControls/mainStart.ascx" tagname="mainStart" tagprefix="uc1" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHoderAdmin">
    <uc1:mainStart ID="mainStart1" runat="server" />
</asp:Content>