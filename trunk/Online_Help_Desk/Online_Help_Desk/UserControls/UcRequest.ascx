<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcRequest.ascx.cs" Inherits="Online_Help_Desk.UserControls.UcRequest" %>
<div id="requests">
    <div id="list_Request">
        <div class="tableWrapper">
            <ul class="Cloumn">
                <li style="width : 50px;">ID</li>
                <li>Request Name</li>
                <li>Facility Name</li>
                <li>Description</li>
                <li>Start Date</li>
                <li>End Date</li>
                <li>Severity</li> 
                <li class="liFinal">Status</li>
            </ul>
            <ul class="rowTable">
                <asp:PlaceHolder ID="plhdRowRequest" runat="server"></asp:PlaceHolder> 
                <%--<li style="width : 50px;">ID</li>
                <li>Request Name</li>
                <li>Facility Name</li>
                <li>Description</li>
                <li>Start Date</li>
                <li>End Date</li>
                <li>Severity</li> 
                <li class="liFinal">Status</li>--%>
            </ul> 
        </div>
        <!-- End .tableWrapper -->
    </div>
    <fieldset class="filesetWrapper">
        <legend>
            <asp:Label ID="lbInfoRequest" runat="server" Text="Information Request"></asp:Label></legend>
        <div class="content_info">
        </div>
    </fieldset>
</div>
