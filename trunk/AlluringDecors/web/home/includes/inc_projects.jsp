<%@page import="java.util.List"%>
<%@page import="app.model.ProjectModel"%>
<%@page import="app.bean.Project"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
            List<Project> lPj = ProjectModel.getInstance().getListObject();
            session.setAttribute("sLPj", lPj);
%>
<table width="100%">
    <tr>
        <td>
            <b>On-Going Projects</b>
        </td>
        <td>
            <b>Up-Coming Projects</b>
        </td>
        <td>
            <b>Accomplished Projects</b>
        </td>
    </tr>
    <tr>
        <td>
            <table>
                <tbody>
                    <c:forEach var="pj" items="${sessionScope['sLPj']}">
                        <c:if test="${pj.statusProject == 0}">
                            <tr>
                                <td>
                                    <div style="margin-left: 5px;margin-bottom: 5px;margin-right: 5px;margin-top: 5px;">
                                        <a href="?cmd=ProjectDetails&id=${pj.projectId}">
                                            ${pj.projectName}
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </td>
        <td>
            <table>
                <tbody>
                    <c:forEach var="pj" items="${sessionScope['sLPj']}">
                        <c:if test="${pj.statusProject == 1}">
                            <tr>
                                <td>
                                    <a href="?cmd=ProjectDetails&id=${pj.projectId}">
                                        ${pj.projectName}
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </td>
        <td>
            <table>
                <tbody>
                    <c:forEach var="pj" items="${sessionScope['sLPj']}">
                        <c:if test="${pj.statusProject == 2}">
                            <tr>
                                <td>
                                    <a href="?cmd=ProjectDetails&id=${pj.projectId}">
                                        ${pj.projectName}
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </td>
    </tr>
</table>
<%
            session.removeAttribute("sLPj");
%>