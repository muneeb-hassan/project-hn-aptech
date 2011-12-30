<%@page import="java.util.Iterator"%>
<%@page import="app.bean.OrderDetails"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="app.model.OrdersModel"%>
<%@page import="app.bean.Users"%>
<%@page import="app.bean.Orders"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:choose>
    <c:when test="${empty sessionScope['login']}">
        <%@include file="../includes/inc_login.jsp" %>
    </c:when>
    <c:when test="${not empty sessionScope['loginx']}">
        <%
                    Users u = (Users) session.getAttribute("loginx");
                    int idx = u.getUserId();
                    List<Orders> lOrder = OrdersModel.getInstance().getListOrderByUserID(idx);
                    session.setAttribute("sLOrder", lOrder);
        %>
        <c:if test="${fn:length(sessionScope['sLOrder']) <= 0}">
            <c:out value="Your are have (0) Order!" />
        </c:if>
        <c:if test="${fn:length(sessionScope['sLOrder']) > 0}">
            Your are have (${fn:length(sessionScope['sLOrder'])}) Order!
            <table width="100%" border="1" style="text-align: center;">
                <tr>
                    <th>FullName</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Date Create</th>
                    <th>Status</th>
                    <th>Price</th>
                    <th>View</th>
                    <th>Cancel</th>
                </tr>
                <c:forEach var="order" items="${sessionScope['sLOrder']}">
                    <tr>
                        <td>${order.fullName}</td>
                        <td>${order.email}</td>
                        <td>${order.phone}</td>
                        <td>
                            <fmt:formatDate value="${order.orderDate}" type="date" pattern="MM/dd/yyyy"/>
                        </td>
                        <td>
                            <c:if test="${order.statusOrder == 0}">
                                <c:out value="UnProcess" />
                            </c:if>
                            <c:if test="${order.statusOrder == 1}">
                                <c:out value="processing" />
                            </c:if>
                            <c:if test="${order.statusOrder == 2}">
                                <c:out value="Process" />
                            </c:if>
                            <c:if test="${order.statusOrder == null}">
                                <c:out value="UnProcess" />
                            </c:if>
                        </td>
                        <td style="text-align: center;">
                            <c:set var="orderx" value="${order.orderDetailses}" scope="session" />
                            <%
                                        Set<OrderDetails> sOD = (Set) session.getAttribute("orderx");
                                        Iterator ie = sOD.iterator();
                                        double total = 0.0;
                                        while (ie.hasNext()) {
                                            OrderDetails od = (OrderDetails) ie.next();
                                            total += (od.getUnitPrice().doubleValue() * od.getQuantity());
                                        }
                                        session.setAttribute("total", total);
                            %>
                        <fmt:formatNumber type="currency" currencyCode="USD" value="${sessionScope['total']}" />
                        <%
                                    session.removeAttribute("orderx");
                                    session.removeAttribute("total");
                        %>
                        </td>
                        <td style="text-align: center;">
                            <a href="?cmd=OrdersDetails&id=${order.orderId}">
                                Details
                            </a>
                        </td>
                        <td style="text-align: center;">
                            <c:if test="${order.statusOrder != 2}">
                                <a href="../ActionFormOrder?cmd=del&id=${order.orderId}">
                                    Cancel
                                </a>
                            </c:if>
                        </td>
                    </tr>
            </c:forEach>
        </table>
        </c:if>
        <%
                    session.removeAttribute("message");
        %>
    </c:when>
</c:choose>