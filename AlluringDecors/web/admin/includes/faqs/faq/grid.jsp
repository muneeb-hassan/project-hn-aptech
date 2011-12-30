<%@page import="java.util.List"%>
<%@page import="app.model.FaqsModel"%>
<%@page import="app.bean.Faqs"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Faqs> lFaq = FaqsModel.getInstance().getListObject();
    session.setAttribute("lFaqs", lFaq);
%>
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            FAQS Manager >> View All FAQS
        </td>
    </tr>
</table>
<table cellpadding="4">
    <tr>
            <td colspan="5" style="text-align: left;">
                <a href="?cmd=CreateFaq">
                    <img alt="Create new Faqs" src="../images/style/add.gif" border="0" />
                    Create a new Faqs
                </a>
            </td>
        </tr>
    <tr>
        <th>ID</th>
        <th>Question</th>
        <th>View</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="faqs" items="${sessionScope['lFaqs']}">
        <tr>
            <td style="text-align: center;">
                <strong> ${faqs.faqsid}</strong>
            </td>
            <td>
                <strong> <a href="?cmd=FaqsDetails&id=${faqs.faqsid}">
                ${faqs.question}
                </a></strong>
            </td>
            <td style="text-align: center;">
                <a href="?cmd=FaqsDetails&id=${faqs.faqsid}">
                    <img border="0" src="../images/style/admin/icon/application_view_list.png" />
                </a>
            </td>
            <td style="text-align: center;">
                <a href="?cmd=UpdateFaqs&id=${faqs.faqsid}">
                    <img border="0" src="../images/style/admin/icon/edit.png" />
                </a>
            </td>
            <td style="text-align: center;">
                <a href="../ActionFormFAQS?cmd=del&id=${faqs.faqsid}">
                    <img border="0" src="../images/style/admin/icon/trash.png" />
                </a>
            </td>
        </tr>
    </c:forEach>
</table>
<%
    session.removeAttribute("lFaqs");
    session.removeAttribute("message");
%>