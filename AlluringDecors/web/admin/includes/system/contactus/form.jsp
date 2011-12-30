<%@page import="app.model.ContactUsModel"%>
<%@page import="app.bean.ContactUs"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
            ContactUs cu = ContactUsModel.getInstance().getContactUs();
            session.setAttribute("sCu", cu);
%>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Aboutus Manager >> View Aboutus
            </td>
        </tr>
    </table>
</center>
<div style="margin-left: 15px">
<c:if test="${not empty sessionScope['message']}">
    <ul>
        <li>
            <strong>${sessionScope['message']}</strong>
        </li>
    </ul>
    <%
                session.removeAttribute("message");
    %>
</c:if>
</div>
<center>
    <form action="../ActionFormAboutUS?id=${sessionScope['sCu'].contactId}" method="post">
        <table>
            <tr>
                <td>
                    <b>Content</b>
                </td>
            </tr>
            <tr>
                <td>
                    <textarea cols="30" rows="5" style="height: 550px" name="txtContent">${sessionScope['sCu'].contents}</textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('txtContent',{
                            filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?Type=Images'
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;">
                    <input type="submit" name="btnCreate" value="  Save  " />
                </td>
            </tr>
        </table>
    </form>
</center>
<%
            session.removeAttribute("sCu");
%>
