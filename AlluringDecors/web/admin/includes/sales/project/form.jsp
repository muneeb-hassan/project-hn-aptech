<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<form action="../ActionFormProjects" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>Project Name</td>
            <td>
                <input type="text" name="txtName" />
            </td>
        </tr>
        <tr>
            <td>Images</td>
            <td>
                <input type="file" name="txtUrl" />
            </td>
        </tr>
        <tr>
            <td>Start Date</td>
            <td>
                <input type="text" ID="datepicker" name="txtStartDate" />
            </td>
        </tr>
        <tr>
            <td>End Date</td>
            <td>
                <input type="text" ID="datepicker2" name="txtEndDate" />
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
                <textarea cols="35" rows="3" name="txtDescription"></textarea>
            </td>
        </tr>
        <tr>
            <td>Details</td>
            <td>
                <textarea cols="35" rows="3" name="txtDetails"></textarea>
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
                <input type="submit" value=" Create " name="btnCreate" />
            </td>
        </tr>
    </table>
</form>