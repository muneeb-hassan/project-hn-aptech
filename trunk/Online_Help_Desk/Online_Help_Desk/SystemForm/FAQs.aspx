<%@ Page Language="C#" MasterPageFile="~/Template/Template.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="Online_Help_Desk.SystemForm.FAQs" %>
<%@ Register src="../UserControls/UcFAQs.ascx" tagname="UcFAQs" tagprefix="uc1" %>
<asp:Content ID="content" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <uc1:UcFAQs ID="UcFAQs1" runat="server" />
</asp:Content>