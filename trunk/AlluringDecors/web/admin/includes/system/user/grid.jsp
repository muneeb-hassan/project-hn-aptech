<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="app.bean.Administrator" %>
<%@page import="app.model.AdministratorModel" %>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Administrator Manager >> View All Administrator
            </td>
        </tr>
    </table>
    <span>
        <c:if test="${not empty sessionScope['message']}">
            <ul>
                <li>
                    <c:out value="${sessionScope['message']}" />
                </li>
            </ul>
            <%
                        session.removeAttribute("message");
            %>
        </c:if>
    </span>
    <table cellpadding="4">
        <tr>
            <td colspan="8" style="text-align: left;">
                <a href="?cmd=CreateAdmin">
                    <img src="../images/style/add.gif" border="0" />Create a Administrator
                </a>
            </td>
        </tr>
        <tr>
            <th class="tdtext1"> ID </th>
            <th class="tdtext1"> UserName </th>
            <th class="tdtext1"> FullName </th>
            <th class="tdtext1"> Address </th>
            <th class="tdtext1"> Phone </th>
            <th class="tdtext1"> Email </th>
            <th class="tdtext1"> Edit </th>
            <th class="tdtext1"> Delete </th>
        </tr>
        <c:forEach var="admin" items="<%= AdministratorModel.getInstance().getListObject()%>">
            <tr class="tdtext2">
                <td>${admin.administratorId}</td>
                <td>${admin.userName}</td>
                <td>${admin.fullName}</td>
                <td>${admin.address}</td>
                <td>${admin.phone}</td>
                <td>${admin.email}</td>
                <td style="text-align: center"><a href="?cmd=UpdateAdmin&id=${admin.administratorId}">
                        <img border="0" src="../images/style/edit.gif" />
                    </a>
                </td>
                <td style="text-align: center"><a href="../ActionFormAdministrator?cmdx=del&key=${admin.administratorId}">
                        <img border="0" src="../images/style/delete.gif" />
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>

</center>
