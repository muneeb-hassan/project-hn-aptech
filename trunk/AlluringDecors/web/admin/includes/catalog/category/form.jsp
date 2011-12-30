<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Category >> Create a new Category for Services
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
    <form action="../ActionFromCategory" method="post">
        <table width="350px" border="1" cellpadding="4">
            <tr>
                <td colspan="2"> &nbsp;</td>
            </tr>
            <tr>
                <td><b>Category Name</b></td>
                <td style="text-align: left;">
                    <input type="text" name="txtCategoryName" size="30" />
                </td>
            </tr>
            <tr>
                <td colspan="2"> &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <input type="submit" class="submit" value="  Create  " name="btnCreate" />
                </td>
            </tr>
        </table>
    </form>
</center>
