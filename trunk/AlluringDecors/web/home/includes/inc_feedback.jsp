<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope['message']}">
    <ul>
        <li>
            <c:out value="${sessionScope['message']}" />
        </li>
    </ul> &nbsp;
    <%
        session.removeAttribute("message");
    %>
</c:if>
<h1>Feedback to administrator</h1> &nbsp;
<div>
    <form action="../ActionFormFeedback" method="post">
        <table cellpadding="5" cellspacing="5" >
        <tr>
            <td>FullName</td>
            <td>
                <input type="text" size="30" name="txtFullName" />
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <input type="text" size="30" name="txtEmail" />
            </td>
        </tr>
        <tr>
            <td>Title</td>
            <td>
                <input type="text" size="30" name="txtTitle" />
            </td>
        </tr>
        <tr>
            <td>Content</td>
            <td>
                <textarea cols="5" rows="5" name="txtContent"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" name="btnCreate" value=" Send " />
            </td>
        </tr>
    </table>
        </form>
</div>