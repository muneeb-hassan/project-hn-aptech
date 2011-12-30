<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope['messageProcess']}">
    <ul>
        <li>
            <c:out value="${sessionScope['messageProcess']}" />
            <%
                session.removeAttribute("messageProcess");
            %>
        </li>
    </ul>
            <center>
                <a href="index.jsp"><b>Back Home</b></a>
            </center>
</c:if>