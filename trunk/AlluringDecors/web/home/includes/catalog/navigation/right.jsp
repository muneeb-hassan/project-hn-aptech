<%@page import="app.bean.Category"%>
<%@page import="java.util.List"%>
<%@page import="app.model.CategoryModel"%>
<%
    if(session.getAttribute("lCategory") == null) {
        List<Category> lCart = CategoryModel.getInstance().getListObject();
        session.setAttribute("lCategory", lCart);
    }
%>
<div class="block block-categories css3">
    <div class="block-title css3">
        <strong><span>Categories</span></strong>
    </div>
    <div class="block-content css3">
        <ul>
            <c:forEach var="cat" items="${sessionScope['lCategory']}">
                <li class="level0">
                    <a href="?cmd=services&id=${cat.categoryId}">
                        <span>${cat.categoryName}</span>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>