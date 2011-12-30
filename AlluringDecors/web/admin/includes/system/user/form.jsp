<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            Administrator Manager >> Create a new Administrator
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
<form action="../ActionFormAdministrator" method="post">
    <table cellpadding="2">
        <tr>
            <td>UserName</td>
            <td>
                <input type="text" name="txtUserName" size="30"/>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <input type="password" name="txtPassword" size="30"/>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <input type="password" name="txtPasswordComfirm" size="30"/>
            </td>
        </tr>
        <tr>
            <td>FullName</td>
            <td>
                <input type="text" name="txtFullName" size="30"/>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <textarea  cols="45" rows="3" name="txtAddress"></textarea>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td>
                <input type="text" name="txtPhone" size="30"/>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <input type="text" name="txtEmail" size="30"/>
            </td>
        </tr>
        <tr>
            <td>Role</td>
            <td>
                <SELECT NAME="cbbRoles">
                    <OPTION VALUE="0" selected>Administrator</OPTION>
                    <OPTION VALUE="1">Employees</OPTION>
                </SELECT>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center">
                <input type="submit" name="btnAdd" value="  Save  " /> &nbsp;
                <input type="reset" name="btnReset" value="  Reset  " />
            </td>
        </tr>
    </table>
</form>
