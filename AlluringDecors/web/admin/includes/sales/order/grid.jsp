<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="app.bean.OrderDetails"%>
<%@page import="app.bean.Orders"%>
<%@page import="java.util.List"%>
<%@page import="app.model.OrdersModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Orders> lOrder = OrdersModel.getInstance().getListObject();
    session.setAttribute("sLOrder", lOrder);
%>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Order Manager >> View All Order
            </td>
        </tr>
    </table>
</center>
<span style="color: red;margin-left: 35px">
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
    <table>
        <tr>
            <th>ID</th>
            <th>FullName</th>
            <th>Address</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Date Create</th>
            <th>Status</th>
            <th>Price</th>
            <th>Payment</th>
            <th>View</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="order" items="${sessionScope['sLOrder']}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.fullName}</td>
                <td>${order.address}</td>
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
                        Set<OrderDetails> sOD = (Set)session.getAttribute("orderx");
                        Iterator ie = sOD.iterator();
                        double total = 0.0;
                        while(ie.hasNext()) {
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
                    <a href="?cmd=payment&id=${order.orderId}">Payment</a>
                </td>
                <td style="text-align: center;">
                    <a href="?cmd=OrdersDetails&id=${order.orderId}">
                        <img border="0" src="../images/style/admin/icon/application_view_list.png" />
                    </a>
                </td>
                <td style="text-align: center;">
                    <a href="../ActionFormOrder?cmd=del&id=${order.orderId}">
                        <img border="0" src="../images/style/admin/icon/trash.png" />
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
<%
    session.removeAttribute("sLOrder");
    session.removeAttribute("message");
%>