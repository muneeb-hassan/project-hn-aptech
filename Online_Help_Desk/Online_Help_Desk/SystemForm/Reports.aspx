<%@ Page Language="C#" MasterPageFile="~/Template/Template.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Online_Help_Desk.SystemForm.Reports" %>
<%@ Register src="../UserControls/UcReports.ascx" tagname="UcReports" tagprefix="uc1" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <uc1:UcReports ID="UcReports1" runat="server" />
</asp:Content>