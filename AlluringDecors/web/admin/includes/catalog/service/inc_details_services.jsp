<%@page import="app.model.ServicesModel"%>
<%@page import="app.bean.Services"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
            String idx = request.getParameter("id");
            if (idx == null) {
                response.sendRedirect("index.jsp?cmd=sevices");
            } else {
                Services servs = ServicesModel.getInstance().getServicesById(Integer.parseInt(idx));
                if (servs == null) {
                    response.sendRedirect("index.jsp?cmd=sevices");
                } else {
                    session.setAttribute("serv", servs);
                }
            }
%>
<div class="row2">

    <div class="title_inner1">
        <div class="title_inner2">

            <h2 class="centerBoxHeading">Details a services of category</h2>

        </div>
    </div>
</div>
<table cellpadding="4" cellspacing="4">
    <tr>
        <td>
            <div class="img_box1">
                <a href="#">
                    <img src="../images/services/${serv.imagesSmall}" alt="${serv.servicesName}" title=" ${serv.servicesName} " width="300" height="300">
                </a><br>
            </div>
        </td>
        <td height="300">
            <div style="border:solid 1px #d0d8da;width: 400px; height: 300px;">
            <table class="price_box" style="margin-top: 5px;border-left: 5px;">
                   <tbody>
                    <tr>
                        <td height="25">
                            <b>${serv.servicesName}</b>
                        </td>
                    </tr>
                    <tr>
                        <td height="175">
                            <div class="col1">
                                ${serv.desription}
                            </div>
                        </td>
                    </tr>
                <td class="td1">
                    <div style="text-align: center">
                        <strong>Price:  <fmt:formatNumber type="currency" currencyCode="USD" value="${serv.priceServices}" /></strong><br>
                    </div>
                </td>
                <tr>
                    <td class="td2" >
                        <div  style="text-align: center">
                            <a href="?cmd=UpdateServ&id=${serv.servicesId}">Edit</a> &nbsp;
                            <a href="../ActionFormServices?cmd=del&id=${serv.servicesId}">Delete</a>
                            <br>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div style="border:solid 1px #d0d8da;width: 703px;">
                <div style="border:solid 0px #d0d8da;border-bottom-width:thin;width: 703px; height: 20px;">
                <h2><b>Details products</b></h2>
                </div>
                <div style="margin: 10px;">
                    ${serv.servicesDetails}
                </div>
            </div>
        </td>
    </tr>
</table>
<%
            session.removeAttribute("serv");
%>