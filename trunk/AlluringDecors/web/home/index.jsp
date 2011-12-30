<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alluring Decors</title>
        <link rel="stylesheet" type="text/css" href="../skin/frontend/css/styles.css">
        <link rel="stylesheet" type="text/css" href="../skin/frontend/css/css3.css">
        <link rel="stylesheet" type="text/css" href="../skin/frontend/css/fonts.css">
        <link media="print" href="../skin/frontend/css/print.css" rel="stylesheet">
        <script type="text/javascript" src="../js/jquery/jquery-1.4.4.js"></script>
        <script type="text/javascript" src="../js/jquery/jquery.validate.js"></script>
        <!--[if lt IE 10]>
        <script type="text/javascript" src="../js/css3/PIE.js"></script>
        <script type="text/javascript" src="../js/css3/attachs.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="wrapper">
            <noscript><div class="noscript"><div class="noscript-inner"><strong>We detected that your JavaScript seem to be disabled.</strong> You must have JavaScript enabled in your browser to utilize the functionality of this website.</div></div></noscript>
            <div class="page">
                <div class="header-container">
                    <div class="header-wrapper">
                        <%@include file="includes/page/header.jsp" %>
                    </div>
                </div>
                <div class="main-container col2-right-layout">
                    <div class="main">
                        <div class="quick-access-container css3">
                            <div class="quick-access-wrapper css3">
                                <%@include file="includes/catalog/mini_search.jsp" %>
                                <%@include file="includes/page/top_links.jsp" %>
                            </div>
                        </div>
                        <div class="col-main css3">
                            <div class="col-main-wrapper css3">
                                <c:choose>
                                    <c:when test="${empty param.cmd}">
                                        <%@include file="includes/catalog/service/featured.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='login'}">
                                        <%@include file="includes/inc_login.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='reg'}">
                                        <%@include file="includes/inc_register.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='services'}">
                                        <%@include file="includes/inc_services.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='details'}">
                                        <%@include file="includes/inc_servicesdetails.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='contactus'}">
                                        <%@include file="includes/inc_aboutus.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='faq'}">
                                        <%@include file="includes/inc_faq.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='viewCart'}">
                                        <%@include file="includes/inc_viewcart.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='feedback'}">
                                        <%@include file="includes/inc_feedback.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='checkout'}">
                                        <%@include file="includes/inc_checkout.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='complete'}">
                                        <%@include file="includes/inc_complatecart.jsp" %>
                                    </c:when>
                                     <c:when test="${param.cmd=='error'}">
                                         <%@include file="includes/inc_error.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='project'}">
                                        <%@include file="includes/inc_projects.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='ProjectDetails'}">
                                        <%@include file="includes/inc_details_project.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='myAccount'}">
                                        <%@include file="includes/inc_myaccount.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='MyOrder'}">
                                        <%@include file="includes/inc_my_orders.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='OrdersDetails'}">
                                        <%@include file="includes/inc_ordersdetails.jsp" %>
                                    </c:when>
                                    <c:when test="${param.cmd=='ViewSearch'}">
                                        <%@include file="includes/inc_search_products.jsp" %>
                                    </c:when>
                                    <c:otherwise>
                                        <%@include file="includes/catalog/service/featured.jsp" %>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-right sidebar">
                            <%@include file="includes/catalog/navigation/right.jsp" %>
                        </div>
                    </div>
                </div>
                <div class="footer-container">
                    <div class="footer">
                        <%@include file="includes/page/footer.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
