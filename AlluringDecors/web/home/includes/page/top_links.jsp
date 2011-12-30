<%@page import="java.util.Hashtable"%>
<%
    Hashtable myCart = (Hashtable)session.getAttribute("cart");
    String MyCartString = "My Cart";
    if(myCart != null && myCart.size() > 0) {
        int size = myCart.size();
        MyCartString += " ("+size+")";
    }
%>
<ul class="links">
    <li class="first"><a title="My Account" href="http://www.localhost.com/magento.1.6.1.0/customer/account/">My Account</a></li>
    <li><a class="top-link-cart" title="My Cart" href="?cmd=viewCart"><%=MyCartString%></a></li>
    <li><a class="top-link-checkout" title="Checkout" href="http://www.localhost.com/magento.1.6.1.0/checkout/">Checkout</a></li>
    <li class=" last"><a title="Log In" href="http://www.localhost.com/magento.1.6.1.0/customer/account/login/">Log In</a></li>
</ul>