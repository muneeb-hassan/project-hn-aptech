<%@page import="app.model.ServicesModel"%>
<%@page import="app.bean.Services"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="app.bean.Category"%>
<%@page import="app.model.CategoryModel"%>
<%
    String idx = request.getParameter("id");
    int id = Integer.parseInt(idx);
    Services serv = ServicesModel.getInstance().getServicesById(id);
    session.setAttribute("sServ", serv);
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
                Services Manager >> Create a new Services
            </td>
        </tr>
    </table>
    <form action="../ActionFormUpdateServices" enctype="multipart/form-data" method="post">
        <table cellpadding="5">
            <tr>
                <td>Category</td>
                <td>
                    <select name="cbbCategory">
                        <c:forEach var="cat" items="<%= CategoryModel.getInstance().getListObject()%>">
                            <c:if test="${sessionScope['sServ'].category.categoryId == cat.categoryId}">
                                <option value="${cat.categoryId}" selected="true" >${cat.categoryName}</option>
                            </c:if>
                            <c:if test="${sessionScope['sServ'].category.categoryId != cat.categoryId}">
                            <option value="${cat.categoryId}" >${cat.categoryName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    Services Name
                </td>
                <td>
                    <input type="hidden" name="txtID" value="${sessionScope['sServ'].servicesId}" />
                    <input type="text" name="txtServicesName" value="${sessionScope['sServ'].servicesName}" size="30" />
                </td>
            </tr>
            <tr>
                <td>
                    Images Old: <br />
                    Images
                </td>
                <td>
                     <input type="text" name="txtUrlOld" value="${sessionScope['sServ'].imagesSmall}" />
                    <br />
                    <input type="file" name="txtUrlImages" size="30" />
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td>
                    <textarea cols="32" rows="5" name="txtDescription">
                        ${sessionScope['sServ'].desription}
                    </textarea>
                </td>
            </tr>
            <tr>
                <td>Price Service</td>
                <td>
                    <input type="text" name="txtPrice" value="${sessionScope['sServ'].priceServices}" size="30" />
                </td>
            </tr>
            <tr>
                <td>
                    Unit Service
                </td>
                <td>
                    <input type="text" name="txtUnitServices" value="${sessionScope['sServ'].unit}" size="30" />
                </td>
            </tr>
            <tr>
                <td>Details</td>
                <td>
                    <textarea name="txtDetails" style="width:500px;height:100px;">
                        ${sessionScope['sServ'].servicesDetails}
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
                    <input type="submit" name="btnUpdate" value=" Update " />
                </td>
            </tr>
        </table>
    </form>
</center>
<%
    session.removeAttribute("sServ");
%>