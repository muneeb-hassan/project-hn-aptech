<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="app.bean.Category"%>
<%@page import="app.model.CategoryModel"%>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Category >> View all category
            </td>
        </tr>
    </table>
    <table class="table_auto" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td colspan="4" style="text-align: left;">
                <a href="?cmd=CreateCat">
                    <img alt="Create new Category" src="../images/style/add.gif" border="0" />
                    Create a new Category
                </a>
            </td>
        </tr>
        <tr>
            <th>ID</th>
            <th width="100%">Name</th>
            <th>Edit</th>
        </tr>
        <c:forEach var="cat" items="<%= CategoryModel.getInstance().getListObject()%>">
            <tr>
                <td style="text-align: center">${cat.categoryId}</td>
                <td>${cat.categoryName}</td>
                <td style="text-align: center;width: 100%;">
                    <a href="?cmd=UpdateCat&id=${cat.categoryId}">
                        <img src="../images/style/edit.gif" border="0" />
                    </a>
                </td>
                
            </tr>
        </c:forEach>
    </table>
</center>
<%
    session.removeAttribute("message");
%>