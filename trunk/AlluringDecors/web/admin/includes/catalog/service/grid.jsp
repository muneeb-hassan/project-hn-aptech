<%@page import="java.util.List"%>
<%@page import="app.model.CategoryModel"%>
<%@page import="app.bean.Category"%>
<%@page import="app.model.ServicesModel"%>
<%@page import="app.bean.Services"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
            if (session.getAttribute("lServ") == null) {
                List<Services> sm = ServicesModel.getInstance().getListObject();
                session.setAttribute("lServ", sm);
            }
            if (session.getAttribute("lCat") == null) {
                List<Category> lCat = CategoryModel.getInstance().getListObject();
                session.setAttribute("lCat", lCat);
            }
%>
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            Services Manager >> View All Services
        </td>
    </tr>
</table>

<div style="text-align: right; margin-bottom: 5px; margin-right: 5px;">
    <form method="post" action="../ActionFormServices">
        <input type="text" name ="txtProductName" size="35" />
        <select name="cbbCategory">
            <option value="${0}" selected="true">--Selected Category--</option>
            <c:forEach var="cat" items="${sessionScope['lCat']}">
                <option value="${cat.categoryId}" >${cat.categoryName}</option>
            </c:forEach>
        </select>
        <input type="submit" value=" Search " name="btnSearch" />
    </form>
</div>

<table border="1" width="100%">
    <tbody>
        <tr>
            <td colspan="7" style="text-align: left;">
                <a href="?cmd=CreateServ">
                    <img alt="Create new Services" src="../images/style/add.gif" border="0" />
                    Create a new Services
                </a>
            </td>
        </tr>
        <tr>
            <th>ID</th>
            <th>Images</th>
            <th>Name</th>
            <th>Price</th>
            <th>View</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="serv" items="${sessionScope['lServ']}">
            <tr>
                <td style="text-align: center;">
                    <strong> <c:out value="${serv.servicesId}" /></strong>
                </td>
                <td style="text-align: center;">
                    <a href="?cmd=ServDetails&id=${serv.servicesId}">
                        <img border="0" src="../images/services/${serv.imagesSmall}" height="110px" width="110px" />
                    </a>
                </td>
                <td>
                    <a href="?cmd=ServDetails&id=${serv.servicesId}">
                        <strong> ${serv.servicesName}</strong>
                    </a>
                </td>
                <td style="text-align: center;">
                    <strong><fmt:formatNumber type="currency" currencyCode="USD" value="${serv.priceServices}" /></strong>
                </td>
                <td style="text-align: center;">
                    <a href="?cmd=ServDetails&id=${serv.servicesId}">
                        <img border="0" src="../images/style/admin/icon/application_view_list.png" />
                    </a>
                </td>
                <td style="text-align: center;">
                    <a href="?cmd=UpdateServ&id=${serv.servicesId}">
                        <img border="0" src="../images/style/admin/icon/edit.png" />
                    </a>
                </td>
                <td style="text-align: center;">
                    <a href="../ActionFormUpdateServices?cmd=del&id=${serv.servicesId}">
                        <img border="0" src="../images/style/admin/icon/trash.png" />
                    </a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<%
            session.removeAttribute("lServ");
            session.removeAttribute("lCat");
            session.removeAttribute("message");
%>