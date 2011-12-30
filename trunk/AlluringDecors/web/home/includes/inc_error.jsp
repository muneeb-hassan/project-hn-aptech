<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${not empty sessionScope['error']}">
        <ul>
            <li>
                <c:out value="${sessionScope['error']}" />
            </li>
        </ul>
        <%
                    session.removeAttribute("error");
        %>
    </c:when>
    <c:otherwise>
        <c:redirect url="index.jsp" />
    </c:otherwise>
</c:choose>
<center>
    <a href="index.jsp">
        <b>Back Home</b>
    </a>
</center>