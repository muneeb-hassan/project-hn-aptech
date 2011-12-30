<%@page import="app.model.FaqsModel"%>
<%@page import="app.bean.Faqs"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
            String idx = request.getParameter("id");
            int id = Integer.parseInt(idx);
            Faqs f = FaqsModel.getInstance().getObjectFaqs(id);
            session.setAttribute("sF", f);
%>
<table width="100%" cellpadding="4" style="margin-top: 0;">
    <tr>
        <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
            FAQS Manager >> Update FAQS
        </td>
    </tr>
</table>
<c:if test="${not empty sessionScope['message']}">
    <div style="margin-left: 35px;">
        <ul>
            <li>
                ${sessionScope['message']}
            </li>
        </ul>
    </div>
    <%
                session.removeAttribute("message");
    %>
</c:if>
<form action="../ActionFormFAQS" method="post">
    <table>
        <tr>
            <td>
                Question:
            </td>
            <td>
                <input type="hidden" value="${sessionScope['sF'].faqsid}" name="txtID" />
                <textarea cols="30" rows="5" name="txtQuestion">${sessionScope['sF'].question}</textarea>
            </td>
        </tr>
        <tr>
            <td>
                Answers:
            </td>
            <td>
                <textarea cols="30" rows="5" name="txtAnswers">${sessionScope['sF'].answer}</textarea>
                <script type="text/javascript">
                    CKEDITOR.replace('txtAnswers',{
                        filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
                        filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?Type=Images'
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" name="btnUpdate" value="  Save  " />
                <br />
                <br />
                <p>
                    <a href="?cmd=ViewFaq">View All Faqs</a>
                </p>
            </td>
        </tr>
    </table>
</form>
