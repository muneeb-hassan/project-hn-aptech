<%@page import="app.bean.Project"%>
<%@page import="app.model.ProjectModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String idx = request.getParameter("id");
    int id = Integer.parseInt(idx);
    Project p = ProjectModel.getInstance().getObjectById(id);
    session.setAttribute("sP", p);
%>
<div>
    <strong><b>Project Name:</b> ${sessionScope['sP'].projectName}</strong>
    <br/>
    <b>Start Date:</b> <fmt:formatDate value="${sessionScope['sP'].startDate}" type="date" pattern="MM/dd/yyyy"/>
    <br/>
    <b>End Date:</b> <fmt:formatDate value="${sessionScope['sP'].endDate}" type="date" pattern="MM/dd/yyyy"/>
    <br/>
    <b>Status:</b>
    <c:if test="${sessionScope['sP'].statusProject == 0}">
        <c:out value="On-Going"/>
    </c:if>
    <c:if test="${sessionScope['sP'].statusProject == 1}">
        <c:out value="Up-Coming"/>
    </c:if>
    <c:if test="${sessionScope['sP'].statusProject == 2}">
        <c:out value="Accomplished"/>
    </c:if>
    <p>
        <img border="0" src="../images/services/${sessionScope['sP'].images}" />
    </p>
    <b>Desciption: </b>
    <p>
        ${sessionScope['sP'].description}
    </p>
    <b>Details:</b>
    <p>
        ${sessionScope['sP'].details}
    </p>
</div>
        <center>
            <div style="margin-bottom: 25px">
                <a href="?cmd=project" >Return View Projects</a>
            </div>
        </center>
<%
    session.removeAttribute("sP");
%>