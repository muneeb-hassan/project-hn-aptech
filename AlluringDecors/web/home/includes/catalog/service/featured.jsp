<%@page import="java.util.List"%>
<%@page import="app.model.ServicesModel"%>
<%@page import="app.bean.Services"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
            session.removeAttribute("lServices");
            List<Services> lServices = null;
            if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                lServices = ServicesModel.getInstance().getListObjectById(id);
            } else {
                lServices = ServicesModel.getInstance().getListObjectTop4();
            }
            session.setAttribute("lServices", lServices);

%>
<div class="page-title">
    <h1>Featured Product</h1>
</div>
<ul class="featured-product-wrapper">
<c:set var="count" property="int" scope="session" value="0"/>
<c:forEach var="serv" items="${sessionScope['lServices']}">
    <li>
        <a class="product-image" title="${serv.servicesName}" href="?cmd=details&id=${serv.servicesId}">
            <img src="../media/services/${serv.imagesSmall}" alt="${serv.servicesName}" title="${serv.servicesName}" width="150" height="142" />
        </a>
        <h2 class="product-name"><a title="${serv.servicesName}" href="index.jsp?cmd=details&id=${serv.servicesId}"><span>${serv.servicesName}</span></a></h2>
        <span class="price_box">
            <span><fmt:formatNumber type="currency" currencyCode="USD" value="${serv.priceServices}"/></span>
        </span>
        <button class="button btn-cart" title="Add To Cart" type="button" onclick="location.href='../ActionFormOrder?cmd=addCart&id=${serv.servicesId}&val=1';">
            <span>Add To Cart</span>
        </button>
    </li>
    <c:set var="count" property="int" scope="session" value="${count + 1}"/>
    <c:if test="${sessionScope['count'] == 4}">
    <c:set var="count" property="int" scope="session" value="0"/>
    </c:if>
</c:forEach>
</ul>
<%
    session.removeAttribute("count");
    session.removeAttribute("lServices");
%>