<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login to Administrator Page</title>
        <link href="../skin/admin/css/reset.css" rel="stylesheet" type="text/css">
        <link href="../skin/admin/css/styles.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="../js/jquery/jquery-1.4.4.js"></script>
        <script type="text/javascript" src="../js/jquery/jquery.validate.js"></script>
    </head>
    <body id="page-login" onload="document.forms.loginForm.txtUserName.focus();">
        <div class="login-container">
            <div class="login-box">
                <form id="loginForm" method="post" action="../ActionFormAdministrator">
                    <div class="login-form">
                        <h2>Log in to Admin Panel</h2>
                        <div id="messages">
                             <c:if test="${not empty sessionScope['message']}">
                                <ul class="messages">
                                    <li class="error-msg">
                                        <ul>
                                            <li><span><c:out value="${sessionScope['message']}" /></span></li>
                                        </ul>
                                    </li>
                                </ul>
                                <% session.removeAttribute("message"); %>
                            </c:if>
                        </div>
                        <div class="input-box input-left">
                            <label for="txtUserName">User Name:</label>
                            <br>
                            <input class="input-text required" type="text" name="txtUserName" id="txtUserName">
                        </div>
                        <div class="input-box input-right">
                            <label for="txtPassword">Password:</label>
                            <br>
                            <input class="input-text required" type="password" name="txtPassword" id="txtPassword">
                        </div>
                        <div class="clear"></div>
                        <div class="form-buttons">
                            <a class="left" href="#">Forgot your password?</a>
                            <input name="btnLogin" class="form-button" type="submit" title="Login" value="Login">
                        </div>
                    </div>
                    <p class="legal">HN-Aptech - AlluringDecors Project. Copyright &copy; 2011 Group.</p>
                </form>
                <div class="bottom"></div>
                <script type="text/javascript">
                    $(document).ready(function(){
                        $("#loginForm").validate();
                    });
                </script>
            </div>
        </div>
    </body>
</html>
