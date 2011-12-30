<%@page import="app.bean.Project"%>
<%@page import="app.model.ProjectModel"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String idx = request.getParameter("id");
    int id = Integer.parseInt(idx);
    Project p = ProjectModel.getInstance().getObjectById(id);
    session.setAttribute("sP", p);
%>
<span style="color: red">
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
    <table width="100%" cellpadding="4" style="margin-top: 0;">
        <tr>
            <td class="pagetitle" style="background-image: url('../images/style/admin/adminmain_04.gif');text-align: center">
                Projects Manager >> Create a new Projects
            </td>
        </tr>
    </table>
</center>
<form action="../ActionFormUpdateProject" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>Project Name</td>
            <td>
                <input type="hidden" value="${sessionScope['sP'].projectId}" name="txtID" />
                <input type="text" value="${sessionScope['sP'].projectName}" name="txtName" />
            </td>
        </tr>
        <tr>
            <td>Images</td>
            <td>
                <input type="hidden" value="${sessionScope['sP'].images}" name="txtUrlOld" />
                <input type="file" name="txtUrl" />
            </td>
        </tr>
        <tr>
            <td>Start Date</td>
            <td>
                <input type="text" ID="datepicker" value="<fmt:formatDate value="${sessionScope['sP'].startDate}" type="date" pattern="MM/dd/yyyy"/>" name="txtStartDate" />
            </td>
        </tr>
        <tr>
            <td>End Date</td>
            <td>
                 <input type="text" ID="datepicker2" value="<fmt:formatDate value="${sessionScope['sP'].endDate}" type="date" pattern="MM/dd/yyyy"/>" name="txtEndDate" />
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <select name="cbbStatus" style="width: 175px;">
                    <option value="0" selected="true">  On-Going  </option>
                    <option value="1">Up-Coming</option>
                    <option value="2">Accomplished</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Description</td>
            <td>
                <textarea cols="35" rows="3" name="txtDescription">
                    ${sessionScope['sP'].description}
                </textarea>
            </td>
        </tr>
        <tr>
            <td>Details</td>
            <td>
                <textarea cols="35" rows="3" name="txtDetails">
                    ${sessionScope['sP'].details}
                </textarea>
                <script type="text/javascript">
                    CKEDITOR.replace('txtDetails',{
                        filebrowserBrowseUrl : '../ckfinder/ckfinder.html',
                        filebrowserImageBrowseUrl : '../ckfinder/ckfinder.html?Type=Images'
                    });
                </script>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" value=" Update " name="btnUpdate" />
            </td>
        </tr>
    </table>
</form>
<%
    session.removeAttribute("sP");
%>