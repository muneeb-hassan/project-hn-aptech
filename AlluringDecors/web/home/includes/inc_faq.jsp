<%@page import="java.util.List"%>
<%@page import="app.bean.Faqs"%>
<%@page import="app.model.FaqsModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
            if (session.getAttribute("lFaqs") == null) {
                List<Faqs> lFaqsx = FaqsModel.getInstance().getListObject();
                session.setAttribute("lFaqs", lFaqsx);
            }
%>
<h1>
    Frequently Asked Questions
</h1>
<c:set var="countf" value="0" scope="session"/>
<c:forEach var="fqa" items="${sessionScope['lFaqs']}">
    <c:set var="countf" value="${countf + 1}" scope="session" /> &nbsp;
    <div>
        <b> <c:out value="${countf}" />. &nbsp;
            ${fqa.question}
        </b>
        <p>
            ${fqa.answer}
        </p>
    </div>
</c:forEach>
<%
            session.removeAttribute("countf");
%>