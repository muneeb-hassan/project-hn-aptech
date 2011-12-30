<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${empty sessionScope['login']}">
    <c:redirect url="login.jsp" />
</c:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Administrator</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="ico.ico">
        <link href="../skin/admin/css/reset.css" rel="stylesheet" type="text/css">
        <link href="../skin/admin/css/styles.css" rel="stylesheet" type="text/css">
        <link href="../skin/admin/css/menu.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../js/jquery/jquery-1.4.4.js"></script>
        <script type="text/javascript" src="../js/jquery/jquery.validate.js"></script>
        <script type="text/javascript" src="../js/ckeditor/ckeditor.js"></script>
    </head>
    <body>
        <div class="wrapper">
            <noscript><div class="noscript"><div class="noscript-inner"><strong>We detected that your JavaScript seem to be disabled.</strong> You must have JavaScript enabled in your browser to utilize the functionality of this website.</div></div></noscript>
            <div class="header">
                <div class="header-top">
                    <%@include file="includes/page/header_top.jsp" %>
                    <div class="clear"></div>
                    <%@include file="includes/page/nav.jsp" %>
                </div>
            </div>
            <div class="middle" id="anchor-content">
                <div id="page:main-container">
                    <div id="messages"><%@include file="includes/page/errors.jsp" %></div>
                    <c:choose>
                        <c:when test="${param.cmd=='ViewCat'}">
                            <%@include file="includes/catalog/category/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='CreateCat'}">
                            <%@include file="includes/catalog/category/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='UpdateCat'}">
                            <%@include file="includes/catalog/category/inc_update_category.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewServ'}">
                            <%@include file="includes/catalog/service/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='CreateServ'}">
                            <%@include file="includes/catalog/service/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewFaq'}">
                            <%@include file="includes/faqs/faq/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='CreateFaq'}">
                            <%@include file="includes/faqs/faq/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewAdmin'}">
                            <%@include file="includes/system/user/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='CreateAdmin'}">
                            <%@include file="includes/system/user/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewFeedback'}">
                            <%@include file="includes/system/feedback/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='FeedbackDetails'}">
                            <%@include file="includes/system/feedback/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewContact'}">
                            <%@include file="includes/system/contactus/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='CreateProject'}">
                            <%@include file="includes/sales/project/form.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewProject'}">
                            <%@include file="includes/sales/project/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ProjectsDetails'}">
                            <%@include file="includes/sales/project/inc_details_projects.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewOrder'}">
                            <%@include file="includes/sales/order/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='OrdersDetails'}">
                            <%@include file="includes/sales/order/inc_details_orders.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ServDetails'}">
                            <%@include file="includes/catalog/service/inc_details_services.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewUser'}">
                            <%@include file="includes/customer/grid.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='payment'}">
                            <%@include file="includes/sales/order/inc_payment_order.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='FaqsDetails'}">
                            <%@include file="includes/faqs/faq/inc_details_faqs.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='UpdateAdmin'}">
                            <%@include file="includes/system/user/inc_update_administrator.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='UpdateFaqs'}">
                            <%@include file="includes/faqs/faq/inc_update_faqs.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='UpdateServ'}">
                            <%@include file="includes/catalog/service/inc_update_services.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='ViewSearch'}">
                            <%@include file="includes/catalog/service/inc_search_services.jsp" %>
                        </c:when>
                        <c:when test="${param.cmd=='UpdateProject'}">
                            <%@include file="includes/sales/project/inc_update_project.jsp" %>
                        </c:when>
                        <c:otherwise>
                            <%@include file="includes/catalog/category/grid.jsp" %>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="footer">
                <p class="bug-report">
                    <a href="mailto:vanthinh87@gmail.com">Help Us Keep Project Healthy - Report All Bugs</a>
                </p>
                <p class="legality">
                    HN-Aptech - AlluringDecors Project.
                    <br>
                    Copyright &copy; 2011 Group.
                </p>
                Version : 0.1 Development Editor
            </div>
        </div>
    </body>
</html>