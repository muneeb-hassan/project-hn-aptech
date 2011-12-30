<%@page import="app.bean.Project"%>
<%@page import="app.model.ProjectModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
            String idx = request.getParameter("id");
            if (!idx.isEmpty()) {
                int id = Integer.parseInt(idx);
                Project p = ProjectModel.getInstance().getObjectById(id);
                session.setAttribute("sP", p);
            }
%>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Projects Manager >> View Details Projects
            </td>
        </tr>
    </table>
</center>
<div>
    <strong><b>Project Name:</b> ${sessionScope['sP'].projectName}</strong>
    <br/>
    <b>Start Date:</b> ${sessionScope['sP'].startDate}
    <br/>
    <b>End Date:</b> ${sessionScope['sP'].endDate}
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
                <a href="?cmd=ViewProject" >Return View Projects</a>
            </div>
        </center>
<%
    session.removeAttribute("sP");
%>