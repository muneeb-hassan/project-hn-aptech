<%@page import="app.bean.Feedback"%>
<%@page import="app.model.FeedbackModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
            String idx = request.getParameter("id");
            if (idx != null) {
                int id = Integer.parseInt(idx);
                Feedback fb = FeedbackModel.getInstance().getObjectById(id);
                session.setAttribute("sFb", fb);
            }
%>
<c:set var="fb" scope="session" value="${sessionScope['sFb']}" />
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            Feedback Manager >> View Details Feedback
        </td>
    </tr>
</table>
<div>
    DateSender: ${fb.createDate}
    <br/>
    Sender: ${fb.fullName}
    <br />
    Email: ${fb.email}
    <br/>
    Title: ${fb.title}
    <br />
    Content:
    <p>
        ${fb.body}
    </p>
</div>
<br/>
<div>
    <strong>Realy Feedback</strong>
</div>
<div>
    <form action="../ActionFormFeedback?cmd=realy&id=${fb.feedbackId}" method="post">
        <table>
            <tr>
                <td> FullName </td>
                <td>
                    <input type="text" name="txtFullName" value="${fb.fullName}" size="30" />
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td>
                    <input type="text" name="txtEmail" value="${fb.email}" size="30" />
                </td>
            </tr>
            <tr>
                <td>ContentRealy</td>
                <td>
                    <textarea cols="5" rows="5" name="txtContentRealy"></textarea>
                    <script type="text/javascript">
                        CKEDITOR.replace('txtContentRealy',{
                            filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?Type=Images'
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <input type="submit" name="btnRealy" value="  Readly  " />
                </td>
            </tr>
        </table>
    </form>
</div>
<%
            session.removeAttribute("sFb");
            session.removeAttribute("fb");
%>