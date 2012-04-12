<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile = "~/Template/Template.Master" CodeBehind="Requests.aspx.cs" Inherits="Online_Help_Desk.SystemForm.Requests" Title="..:: Request ::.." %>

 <%@ Register src="../UserControls/UcRequest.ascx" tagname="UcRequest" tagprefix="uc1" %>
 <asp:Content ID="content" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
     <uc1:UcRequest ID="UcRequest1" runat="server" />
 </asp:Content>