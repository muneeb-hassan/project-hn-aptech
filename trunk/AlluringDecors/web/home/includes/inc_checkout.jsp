<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${not empty sessionScope['error']}">
    <ul style="color: red;">
        <li>
            <c:out value="${sessionScope['error']}" />
        </li>
    </ul>
    <%

                session.removeAttribute("error");
    %>
</c:if>
<br />
<table>
    <tr>
        <td>
            <h1>Checkout</h1><br />
            Please fill in your details below and press "Order Now" to place your order.
        </td>
    </tr>
    <tr>
        <td>
            <form action="../ActionFormOrder?cmd=process" method="post">
                <table>
                    <tbody>
                        <tr>
                            <td>FullName</td>
                            <td>
                                <input type="text" value="${sessionScope['loginx'].fullName}" name="txtFullName" />
                            </td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td>
                                <input type="text" value="${sessionScope['loginx'].email}" name="txtEmail" />
                            </td>
                        </tr>
                        <tr>
                            <td>Phone</td>
                            <td>
                                <input type="text" value="${sessionScope['loginx'].phone}" name="txtPhone" />
                            </td>
                        </tr>
                        <tr>
                            <td>Address</td>
                            <td>
                                <textarea cols="30" rows="5" name="txtAddress">
                                    ${sessionScope['loginx'].address}
                                </textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>Start Date</td>
                            <td>
                                <input id="datepicker" type="text" name="txtStartDate" />
                            </td>
                        </tr>
                        <tr>
                            <td>End Date</td>
                            <td>
                                <input id="datepicker2" type="text" name="txtEndDate" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <input type="image" name="btnProcess" src="../images/style/proceed_over.gif" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </td>
    </tr>
</table>

