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
            FAQS Manager >> View Details FAQS
        </td>
    </tr>
</table>
<table width="98%">
    <tr>
        <td>
            Question:<br/>
            ${sessionScope['sF'].question}
        </td>
    </tr>
    <tr>
        <td>
            Answer:<br />
            ${sessionScope['sF'].answer}
        </td>
    </tr>
    <tr>
        <td style="text-align: center;">
            <a href="?cmd=ViewFaq">View all Faqs</a>
        </td>
    </tr>
</table>
<%
            session.removeAttribute("sF");
%>