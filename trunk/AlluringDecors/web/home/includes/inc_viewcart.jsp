<%@page import="app.bean.Cart"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope['cart']}">
    
    <h1>My Cart</h1>
    <br>
    <span style="color: red;">
        <c:if test="${not empty sessionScope['error']}">
            <ul>
                <li>
                    <c:out value="${sessionScope['error']}" />
                </li>
            </ul>
                <%
                    session.removeAttribute("error");
                %>
        </c:if>
    </span>
    <%
        session.removeAttribute("totalPay");
        session.removeAttribute("countItems");
        Hashtable cart = (Hashtable)session.getAttribute("cart");
        List<Cart> listCart = new ArrayList<Cart>();
        Enumeration e = cart.keys();
        while(e.hasMoreElements()) {
            listCart.add((Cart)cart.get(e.nextElement()));
        }
        session.setAttribute("myCarts", listCart);
    %>
    <form action="../ActionFormOrder?cmd=updateCart" method="post">
    <table width="95%" cellspacing="1" cellpadding="1" border="1" bgcolor="#cccccc">
        <tbody><tr>
                <td width="3%" bgcolor="#ffffff" align="center"><strong> # </strong></td>
                <td width="34%" bgcolor="#ffffff"><strong>Product Name</strong></td>
                <td width="19%" bgcolor="#ffffff" align="center"><strong>Price(USD)</strong></td>
                <td width="12%" bgcolor="#ffffff" align="center"><strong>Quantity</strong></td>
                <td width="21%" bgcolor="#ffffff" align="center"><strong>Total Price</strong></td>
                <td width="11%" bgcolor="#ffffff">&nbsp;</td>
            </tr>
            <c:set var="count" scope="session" property="int" value="${0}" />
            <c:forEach var="myCart" items="${sessionScope['myCarts']}">
                <tr>
                    <td bgcolor="#ffffff" align="center">${sessionScope['count']}</td>
                    <td bgcolor="#ffffff">${myCart.servicesName}</td>
                    <td bgcolor="#ffffff" align="center">
                        <fmt:formatNumber type="currency" currencyCode="USD" value="${myCart.price}" />
                    </td>
                    <td bgcolor="#ffffff" align="center">
                        <input type="text" size="5" value="${myCart.quantity}" name="txtQuantity_${myCart.servicesID}">    </td>
                    <td bgcolor="#ffffff" align="center">
                        <fmt:formatNumber type="currency" currencyCode="USD" value="${myCart.quantity * myCart.price}" />
                    </td>
                    <td bgcolor="#ffffff">&nbsp;<a rel="nofollow" href="../ActionFormOrder?cmd=delCart&id=${myCart.servicesID}">Del</a></td>
                </tr>
                <c:set var="count" scope="session" property="int" value="${count + 1}" />
                <c:set var="totalPay" scope="session" value="${totalPay + (myCart.quantity * myCart.price)}" />
            </c:forEach>


            <tr>
                <td bgcolor="#ffffff" align="right" colspan="4">Total payment (USD)</td>
                <td bgcolor="#ffffff" align="right" colspan="2">
                    <fmt:formatNumber type="currency" currencyCode="USD" value="${totalPay}" />
                    </td>
            </tr>
            <tr>
                <td bgcolor="#ffffff" colspan="6">
                    <strong>&nbsp;There are ${sessionScope['count']} products in your cart.
                        <a href="index.jsp?cmd=services" style="color: red:">
                            <b> Click here </b>
                        </a> to continue shopping.
                    </strong>
                </td>
            </tr>

            <tr>
                <td bgcolor="#ffffff" align="center" colspan="6">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../ActionFormOrder?cmd=removeCart">
                        <img border="0" src="../images/style/clearCart_cart_icon.gif" />
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="image" name="btnUpdateCart" src="../images/style/update_cart_icon.gif">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../ActionFormOrder?cmd=checkout">
                        <img border="0" src="../images/style/checkout_cart_icon.gif">
                    </a>
                    
                </td>
            </tr>
        </tbody>
    </table>
    </form>
    </c:if>
    <c:if test="${empty sessionScope['cart']}">
    <div>
        <strong>
            you do not have any products!.
        </strong>
    </div>
</c:if>