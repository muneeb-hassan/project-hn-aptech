<%@page import="app.model.CategoryModel"%>
<%@page import="app.bean.Category"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String idx = request.getParameter("id");
    int id = Integer.parseInt(idx);
    Category cat = CategoryModel.getInstance().getCategoryById(id);
    session.setAttribute("sCat", cat);
%>
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
    <body>
        <center>
            <h1>Update Category</h1>
            <form action="../ActionFromCategory" method="post">
                <table>
                    <tr>
                        <td>Category Name</td>
                        <td>
                            <input type="hidden" name="txtID" value="${sessionScope['sCat'].categoryId}" />
                            <input type="text" name="txtCategoryName" value="${sessionScope['sCat'].categoryName}" size="30" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center;">
                            <input type="submit" value="  Update  " name="btnUpdate" />
                        </td>
                    </tr>
                </table>
            </form>
                
        </center>
    </body>
</html>
