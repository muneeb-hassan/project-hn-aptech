<%@page import="java.util.List"%>
<%@page import="app.model.ProjectModel"%>
<%@page import="app.bean.Project"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Project> lPro = ProjectModel.getInstance().getListObject();
    session.setAttribute("sLPro", lPro);
%>
<center>
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Projects Manager >> View All Projects
            </td>
        </tr>
    </table>
</center>
<span style="color: red;margin-left: 35px">
    <c:if test="${not empty sessionScope['message']}">
        <ul>
            <li>
                <c:out value="${sessionScope['message']}" />
            </li>
        </ul>
        <%
                    session.removeAttribute("message");
        %>
    </c:if>
</span>
<center>
    <table>
        <tr>
            <td colspan="4" style="text-align: left;">
                <a href="?cmd=CreateProject">
                    <img alt="Create new Project" src="../images/style/add.gif" border="0" />
                    Create a new Project
                </a>
            </td>
        </tr>
        <tr>
            <th>ID</th>
            <th>Images</th>
            <th>Project Name</th>
            <th>Start Date</th>
            <th>End Date</th>
            <th>Status</th>
            <th>View</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="p" items="${sessionScope['sLPro']}">
            <tr>
                <td><strong>${p.projectId}</strong></td>
                <td>
                    <a href="?cmd=ProjectsDetails&id=${p.projectId}">
                        <img border="0" src="../images/services/${p.images}" height="80" width="80" />
                    </a>
                </td>
                <td>
                    <a href="?cmd=ProjectsDetails&id=${p.projectId}">
                        <strong>${p.projectName}</strong>
                    </a>
                </td>
                <td>${p.startDate}</td>
                <td>${p.endDate}</td>
                <td style="text-align: center;">
                    <c:if test="${p.statusProject == 0}">
                        <c:out value="On-Going"/>
                    </c:if>
                    <c:if test="${p.statusProject == 1}">
                        <c:out value="Up-Coming"/>
                    </c:if>
                    <c:if test="${p.statusProject == 2}">
                        <c:out value="Accomplished"/>
                    </c:if>
                </td>
                <td style="text-align: center;">
                    <a href="?cmd=ProjectsDetails&id=${p.projectId}">
                        <img border="0" src="../images/style/admin/icon/application_view_list.png" />
                    </a>
                </td>
                <td style="text-align: center;">
                    <a href="?cmd=UpdateProject&id=${p.projectId}">
                        <img border="0" src="../images/style/admin/icon/edit.png" />
                    </a>
                </td>
                <td style="text-align: center;">
                    <a href="../ActionFormProjects?cmd=del&id=${p.projectId}">
                        <img border="0" src="../images/style/admin/icon/trash.png" />
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</center>
<%
    session.removeAttribute("sLPro");
%>