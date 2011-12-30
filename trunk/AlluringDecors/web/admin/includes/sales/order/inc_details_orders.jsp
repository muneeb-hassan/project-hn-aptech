<%@page import="app.model.OrdersModel"%>
<%@page import="app.bean.Orders"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
            String idx = request.getParameter("id");
            if (!idx.isEmpty()) {
                int id = Integer.parseInt(idx);
                Orders od = OrdersModel.getInstance().getObjectById(id);
                session.setAttribute("sOrder", od);
            }
%>
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            Order Manager >> View Details Orders
        </td>
    </tr>
</table>

<table border="1">
    <tr>
        <td valign="top">
            Order ID: ${sessionScope['sOrder'].orderId}
                        <br />
                        Date Ordered:<fmt:formatDate value="${sessionScope['sOrder'].orderDate}" type="date" pattern="MM/dd/yyyy"/>
                        <br />
                        Payment Method: Cash alone
                        <br />
                        Status Order: 
                                        <c:if test="${sessionScope['sOrder'].statusOrder == 0}">
                                            <c:out value="UnProcess" />
                                        </c:if>
                                        <c:if test="${sessionScope['sOrder'].statusOrder == 1}">
                                            <c:out value="processing" />
                                        </c:if>
                                        <c:if test="${sessionScope['sOrder'].statusOrder == 2}">
                                            <c:out value="Processed" />
                                        </c:if>
                                        <c:if test="${sessionScope['sOrder'].statusOrder == null}">
                                            <c:out value="UnProcess" />
                                        </c:if>
               
        </td>
    </tr>
    <tr>
        <td valign="top">
            <b>Shipping Address</b>
                        <br />
                        FullName: ${sessionScope['sOrder'].fullName} <br />
                        Address: ${sessionScope['sOrder'].address} <br/>
                        Email: ${sessionScope['sOrder'].email} <br/>
                        Phone: ${sessionScope['sOrder'].phone}
                   
        </td>
    </tr>
    <tr >
        <td valign="top">
            <table border="1">
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <c:set var="total" scope="session" value="0" />
                <c:forEach var="orderdetails" items="${sessionScope['sOrder'].orderDetailses}">
                    <tr>
                        <td>${orderdetails.services.servicesName}</td>
                        <td>
                            <fmt:formatNumber type="currency" currencyCode="USD" value="${orderdetails.unitPrice}" />

                        </td>
                        <td>${orderdetails.quantity}</td>
                        <td>
                            <fmt:formatNumber type="currency" currencyCode="USD" value="${orderdetails.unitPrice * orderdetails.quantity}" />
                        </td>
                    </tr>
                    <c:set var="total" scope="session" value="${total + (orderdetails.unitPrice * orderdetails.quantity)}" />
                </c:forEach>
                <tr>
                    <td colspan="2">

                    </td>
                    <td style="text-align: right;">
                        Total Payment:
                    </td>
                    <td>
                        <fmt:formatNumber type="currency" currencyCode="USD" value="${total}" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <hr>
                        <div style="text-align:right; margin-right: 55px;">
                            <a href="?cmd=payment&id=${sessionScope['sOrder'].orderId}">PAYMENT</a>
                            &nbsp;
                            <a href="../ActionFormOrder?cmd=update&id=${sessionScope['sOrder'].orderId}&s=${sessionScope['sOrder'].statusOrder+1}">
                                <c:if test="${sessionScope['sOrder'].statusOrder==0}">
                                    Update Status: processing
                                </c:if>
                                <c:if test="${sessionScope['sOrder'].statusOrder==1}">
                                    Update Status: Process
                                </c:if>
                                <c:if test="${sessionScope['sOrder'].statusOrder==null}">
                                    Update Status: processing
                                </c:if>
                            </a>
                        </div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="text-align: center;">
            <strong><a href="?cmd=ViewOrder">Back View Order</a></strong>
        </td>
    </tr>
</table>
<%
            session.removeAttribute("total");
            session.removeAttribute("sOrder");
%>