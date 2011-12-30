<%@page import="java.util.List"%>
<%@page import="app.model.UsersModel"%>
<%@page import="app.bean.Users"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Users> lUser = UsersModel.getInstance().getListObject();
    session.setAttribute("sLUser", lUser);
%>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Projects Manager >> View All Projects
            </td>
        </tr>
    </table>
</center>
<table>
    <tr>
        <th>ID</th>
        <th>UserName</th>
        <th>FullName</th>
        <th>Address</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="user" items="${sessionScope['sLUser']}">
        <tr>
            <td>${user.userId}</td>
            <td>${user.userName}</td>
            <td>${user.fullName}</td>
            <td>${user.address}</td>
            <td>${user.email}</td>
            <td>${user.phone}</td>
            <td>
                <a href="../ActionFormUser?cmd=del&id=${user.userId}">
                    <img border="0" src="../images/style/admin/icon/trash.png"/>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<%
    session.removeAttribute("sLUser");
    session.removeAttribute("message");
%>