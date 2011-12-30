<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="app.model.OrdersModel"%>
<%@page import="app.bean.Orders"%>
<%
            String idx = request.getParameter("id");
            if (!idx.isEmpty()) {
                int id = Integer.parseInt(idx);
                Orders od = OrdersModel.getInstance().getObjectById(id);
                session.setAttribute("sOrder", od);
            }
%>
<table >
    <tr>
        <td>
            <div style="text-align: center; font-size: 32px;font-weight: bold;">
                Payment Order
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <td>Order ID:</td>
                    <td>${sessionScope['sOrder'].orderId}</td>
                </tr>
                <tr>
                    <td>Type Payment:</td>
                    <td>Cash alone</td>
                </tr>
                <tr>
                    <td>Date Order:</td>
                    <td><fmt:formatDate value="${sessionScope['sOrder'].orderDate}" type="date" pattern="MM/dd/yyyy"/></td>
                </tr>
                <tr>
                    <td>FullName:</td>
                    <td>${sessionScope['sOrder'].fullName}</td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td>${sessionScope['sOrder'].phone}</td>
                </tr>
                <tr>
                    <td>Email - Address:</td>
                    <td> ${sessionScope['sOrder'].address}</td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>${sessionScope['sOrder'].address}</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Pay</th>
                </tr>
                <c:set var="total" scope="session" value="0" />
                <c:forEach var="order" items="${sessionScope['sOrder'].orderDetailses}">
                    <tr>
                        <td>${order.services.servicesId}</td>
                        <td>${order.services.servicesName}</td>
                        <td>
                            <fmt:formatNumber type="currency" currencyCode="USD" value="${order.unitPrice}" />
                        </td>
                        <td>
                            ${order.quantity}
                        </td>
                        <td><fmt:formatNumber type="currency" currencyCode="USD" value="${order.unitPrice * order.quantity}" /></td>
                        <td><c:set var="total" scope="session" value="${total + (order.unitPrice * order.quantity)}" /></td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="3">

                    </td>
                    <td style="text-align: right;">
                        Total Payment:
                    </td>
                    <td>
                        <fmt:formatNumber type="currency" currencyCode="USD" value="${total}" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <c:choose>
                <c:when test="${fn:length(sessionScope['sOrder'].payments) > 0}">
                    <c:forEach var="p" items="${sessionScope['sOrder'].payments}">
                        <c:if test="${p.statusPay == 0}">
                            <b>Status Pay:</b>
                            <c:out value="Payment Comlete"/>
                            <br>
                            <table>
                                <tr>
                                    <td>
                                        <b> ID </b>
                                    </td>
                                    <td><b>Date Pay</b></td>
                                    <td><b>Money Pay</b></td>
                                </tr>
                                <c:set var="vMoney" value="0" scope="session" />
                                <c:forEach var="pdx" items="${p.paymentDetailses}">
                                    <tr>
                                        <td>
                                            ${pdx.paymentDetailsId}
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${pdx.datePaid}" type="date" pattern="MM/dd/yyyy"/>
                                         </td>
                                        <td>
                                            <strong>
                                                <c:set var="vMoney" value="${vMoney + pdx.paidAmount}" scope="session" />
                                                <fmt:formatNumber type="currency" currencyCode="USD" value="${pdx.paidAmount}" />
                                            </strong>
                                        </td>
                                    </tr>
                                </c:forEach>
                                    <tr>
                                        <td colspan="3">
                                            Total amount payable: <fmt:formatNumber type="currency" currencyCode="USD" value="${total}" /> &nbsp; &nbsp;
                                            Total amount paid: <fmt:formatNumber type="currency" currencyCode="USD" value="${vMoney}" />
                                            <br />
                                            The total amount left pay: <fmt:formatNumber type="currency" currencyCode="USD" value="${total - vMoney}" />
                                        </td>
                                    </tr>
                            </table>

                        </c:if>
                        <c:if test="${p.statusPay == 1}">
                            <b>Status Pay:</b>: Not Complete
                            <br />
                            <table>
                                <tr>
                                    <td><b> ID </b>
                                    </td>
                                    <td><b>Date Pay</b></td>
                                    <td><b>Money Pay</b></td>
                                </tr>
                                <c:set var="vMoney" value="0" scope="session" />
                                <c:forEach var="pdx" items="${p.paymentDetailses}">
                                    <tr>
                                        <td>
                                            ${pdx.paymentDetailsId}
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${pdx.datePaid}" type="date" pattern="MM/dd/yyyy"/>
                                         </td>
                                        <td>
                                            <strong>
                                                <c:set var="vMoney" value="${vMoney + pdx.paidAmount}" scope="session" />
                                                <fmt:formatNumber type="currency" currencyCode="USD" value="${pdx.paidAmount}" />
                                            </strong>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="3">
                                        Total amount payable: <fmt:formatNumber type="currency" currencyCode="USD" value="${total}" /> &nbsp; &nbsp;
                                        Total amount paid: <fmt:formatNumber type="currency" currencyCode="USD" value="${vMoney}" />
                                        <br />
                                        The total amount left pay: <fmt:formatNumber type="currency" currencyCode="USD" value="${total - vMoney}" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            Payment:
                            <br />
                            <form action="../FormActionPayment" method="post">
                                <table>
                                    <tr>
                                        <td>
                                            Money Pay:
                                        </td>
                                        <td>
                                            <input type="hidden" value="${sessionScope['sOrder'].orderId}" name="txtOrderID" />
                                            <input type="hidden" value="${total - vMoney}" name="totalLeftPay" />
                                            <input type="hidden" value="${p.paymentId}" name="txtPayID" />
                                            <input type="text" value="0" name="txtMoney" >
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center;">
                                            <input type="submit" value=" Payment " name="btnPayment2" />
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </c:if>
                    </c:forEach>

                </c:when>
                <c:when test="${fn:length(sessionScope['sOrder'].payments) <= 0}">
                    <form action="../FormActionPayment" method="post">
                        <table>
                            <tr>
                                <td>
                                    Payment Type:
                                </td>
                                <td>
                                    <select name="cbbTypePay">
                                        <option value="0">Pay One</option>
                                        <option value="1">Repayment</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Date Final Pay</td>
                                <td>
                                    <input type="text" ID="datepicker" name="txtDateFinal" />
                                </td>
                            </tr>
                            <tr>
                                <td>Due Money</td>
                                <td>
                                    <input type="text" value="0" name="txtDueMoney" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Money Pay:
                                </td>
                                <td>
                                    <input type="hidden" value="${total}" name="txtTotalMoney" />
                                    <input type="hidden" value="${sessionScope['sOrder'].orderId}" name="txtID" />
                                    <input type="text" value="0" name="txtMoney" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <div><input type="submit" value=" Payemnt " name="btnPayment" /></div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </c:when>
            </c:choose>

        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <a href="?cmd=ViewOrder"><b>View Orders</b></a>
        </td>
    </tr>
</table>
<%
            session.removeAttribute("sOrder");
%>
