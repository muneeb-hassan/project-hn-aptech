<div align="center">
    <form id="frmLogin" name="frmLogin" method="post" action="../ActionFormUser">
        <table width="200" border="1">
            <tr>
                <td colspan="2"><div align="center"><strong>Login</strong></div></td>
            </tr>
            <tr>
                <td>UserName</td>
                <td>
                    <label>
                        <input type="text" name="txtUserName" />
                    </label>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <label>
                        <input type="password" name="txtPassowrd" />
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2"> <div align="center"><a href="index.jsp?cmd=reg">Sign up</a></div></td>
            </tr>
            <tr>
                <td colspan="2"><div align="center">

                        <label>
                            <input type="submit" name="btnLogin" value="  Login  " />
                        </label>

                    </div></td>
            </tr>
        </table>
        <span style="color: red;">
            <c:if test="${not empty sessionScope['message']}">
                <c:out value="${sessionScope['message']}" />
                <%
                    session.removeAttribute("message");
                %>
            </c:if>
        </span>
    </form>
</div>