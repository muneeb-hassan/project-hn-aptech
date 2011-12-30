<span style="color: red;">
    <c:if test="${not empty sessionScope['message']}">
        <ul>
            <li><c:out value="${sessionScope['message']}" /></li>
        </ul>
        <%
                    session.removeAttribute("message");
        %>
    </c:if>
</span>
    <h1>
        Create new Account
    </h1> &nbsp;
<div style="margin-left: 45px">
    <form name="frmRegister" method="post" action="../ActionFormUser">
        <table border="1">
            
            <tr>
                <td>UserName</td>
                <td><label>
                        <input type="text" name="txtUserName"/>
                    </label></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><label>
                        <input type="password" name="txtPassword" />
                    </label></td>
            </tr>
            <tr>
                <td>Password Confirm</td>
                <td><label>
                        <input type="password" name="txtPasswordConfirm" />
                    </label></td>
            </tr>
            <tr>
                <td>FullName</td>
                <td><label>
                        <input type="text" name="txtFullName" />
                    </label></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><label>
                        <textarea cols="5" name="txtAddress" rows="4"></textarea>
                    </label></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><label>
                        <input type="text" name="txtEmail" />
                    </label></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><label>
                        <input type="text" name="txtPhone"  />
                    </label></td>
            </tr>
            <tr>
                <td colspan="2"><div align="center">
                        <label>
                            <input type="submit" name="btnCreate" value="Create" />
                        </label>
                        <label>
                            <input type="reset" name="btnReset" value="Reset" />
                        </label>
                    </div></td>
            </tr>
        </table>
    </form>
</div>