<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="app.bean.ContactUs"%>
<%@page import="app.model.ContactUsModel"%>
<%
    if(session.getAttribute("lAboutus") == null) {
        ContactUs c = (ContactUs) ContactUsModel.getInstance().getContactUs();
        session.setAttribute("lAboutus", c);
    }
%>
<p>
    <c:out escapeXml="false" value="${sessionScope['lAboutus'].contents}" />
</p>
<%
    session.removeAttribute("lAboutus");
%>