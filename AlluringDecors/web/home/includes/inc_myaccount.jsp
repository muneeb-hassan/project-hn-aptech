<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${empty sessionScope['loginx']}">
        <%@include file="../includes/inc_login.jsp" %>
    </c:when>
    <c:when test="${not empty sessionScope['login']}">
        <table style="margin-top: 35px;text-align: center;" cellpadding="10" cellspacing="10" width="100%">
            <tr>
                <td>
                    <a href="?cmd=myProfile">
                        My Profile
                    </a>
                </td>
                
            </tr>
            <tr>
                <td>
                    <a href="?cmd=myOrder">
                        My Order
                    </a>
                </td>
            </tr>
        </table>
    </c:when>
</c:choose>
