<%@page import="java.util.List"%>
<%@page import="app.model.FeedbackModel"%>
<%@page import="app.bean.Feedback"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Feedback> lFb = FeedbackModel.getInstance().getListObject();
    session.setAttribute("lFb", lFb);
%>
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            Feedback Manager >> View All Feedback
        </td>
    </tr>
</table>
<table>
    <tr>
        <th>ID</th>
        <th>Sender</th>
        <th>Email</th>
        <th>Title</th>
        <th>DateSend</th>
        <th>Status</th>
        <th>View</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="fb" items="${sessionScope['lFb']}">
        <tr>
            <td>
                <strong>${fb.feedbackId}</strong>
            </td>
            <td>
                <strong>${fb.fullName}</strong>
            </td>
            <td>
                <strong>${fb.email}</strong>
            </td>
            <td>
                <strong>${fb.title}</strong>
            </td>
            <td>
                <strong>${fb.createDate}</strong>
            </td>
            <td style="text-align: center;">
                <strong>
                    <c:if test="${fb.readFeedback == 0}">
                        UnReply
                    </c:if>
                    <c:if test="${fb.readFeedback == 1}">
                        Reply
                    </c:if>
                    <c:if test="${fb.readFeedback == null}">
                        UnReply
                    </c:if>
                </strong>
            </td>
            <td style="text-align: center;">
                    <a href="?cmd=FeedbackDetails&id=${fb.feedbackId}">
                        <img border="0" src="../images/style/admin/icon/application_view_list.png" />
                    </a>
                </td>
                <td style="text-align: center;">
                    <a href="../ActionFormFeedback?cmd=del&id=${fb.feedbackId}">
                        <img border="0" src="../images/style/admin/icon/trash.png" />
                    </a>
                </td>
        </tr>
    </c:forEach>
</table>
<%
    session.removeAttribute("lFb");
    session.removeAttribute("message");
%>