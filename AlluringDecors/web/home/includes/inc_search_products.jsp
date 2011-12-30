<%@page import="java.util.List"%>
<%@page import="app.model.ServicesModel"%>
<%@page import="app.bean.Services"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:if test="${fn:length(sessionScope['lServx']) <=0}">
    Total: (0) results found.
</c:if>
<c:if test="${fn:length(sessionScope['lServx']) > 0}">
    Total: (${fn:length(sessionScope['lServx'])}) results found.
    <br />
    <table style="width: 100%;">
        <tbody>
            <tr>
                <td id="column_center" style="width: 100%;" valign="top">
                    <div style="padding: 0pt 9px;">
                        <div class="centerColumn" id="indexDefault">
                            <div id="indexDefaultMainContent" class="content"></div>
                            <div class="centerBoxWrapper" id="featuredProducts">
                                <div class="title_box">
                                    <div class="row1">
                                        <div class="title_inner1">
                                            <div class="title_inner2">
                                                <div class="title_inner3"><img src="../images/style/pixel_trans.gif" alt="" width="1" height="1"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row2">

                                        <div class="title_inner1">
                                            <div class="title_inner2">

                                                <h2 class="centerBoxHeading">List all services of category</h2>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="maintep" style="margin-bottom: 0px;">
                                    <div class="row11">
                                        <div class="inn1">
                                            <div class="inn2"><img src="../images/style/pixel_trans.gif" alt="" width="1" height="1"><br></div>
                                        </div>
                                    </div>

                                    <div class="row22">
                                        <div class="inn1">
                                            <div class="inn2">
                                                <c:set var="count" property="int" scope="session" value="0"/>
                                                <c:forEach var="serv" items="${sessionScope['lServx']}">
                                                    <div class="centerBoxContentsFeatured centeredContent back" style="width: 25%;">
                                                        <div style="margin-right: 0px;">
                                                            <div class="product_box" style="margin-bottom: 30px;">
                                                                <div class="product_box_side_bg" style="">
                                                                    <div class="bg_inner911">
                                                                        <table style="width: 100%; margin-bottom: 13px;">
                                                                            <tbody><tr>
                                                                                    <td height="250px">
                                                                                        <div class="img_box1">
                                                                                            <a href="index.jsp?cmd=details&id=${serv.servicesId}"><img src="../images/services/${serv.imagesSmall}" alt="${serv.servicesName}" title=" ${serv.servicesName} " width="150" height="142"></a><br>
                                                                                        </div>
                                                                                        <br>
                                                                                        <div class="product_box_name">
                                                                                            <div class="indent">
                                                                                                <a href="index.jsp?cmd=details&id=${serv.servicesId}">${serv.servicesName}</a>
                                                                                                <br>
                                                                                            </div>
                                                                                        </div>
                                                                                    </td>

                                                                                </tr>
                                                                                <tr>
                                                                                    <td height="145px">
                                                                                        <div class="description_box">
                                                                                            <c:if test="${fn:length(serv.desription) > 150}">
                                                                                                ${fn:substring(serv.desription,0,200)}...
                                                                                            </c:if>
                                                                                            <c:if test="${fn:length(serv.desription) <= 150}">
                                                                                                ${serv.desription}
                                                                                            </c:if>
                                                                                            <br>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody></table>
                                                                        <table class="price_box" style="margin-top: 5px;">
                                                                            <tbody><tr>
                                                                                    <td class="td1">

                                                                                        <div class="coll1">
                                                                                            <strong><fmt:formatNumber type="currency" currencyCode="USD" value="${serv.priceServices}" /></strong><br>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="td2">
                                                                                        <div class="coll2">
                                                                                            <a href="../ActionFormOrder?cmd=addCart&id=${serv.servicesId}&val=1"><img src="../images/style/buynow.gif" alt="" title=" Buy product " width="114" height="23"></a><br>
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody></table>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                    <c:set var="count" property="int" scope="session" value="${count + 1}"/>
                                                    <c:if test="${sessionScope['count'] == 4}">
                                                        <c:set var="count" property="int" scope="session" value="0"/>
                                                        <br class="clearBoth">
                                                    </c:if>
                                                </c:forEach>
                                                <br class="clearBoth">
                                                <%
                                                            session.removeAttribute("count");
                                                            session.removeAttribute("lServx");
                                                %>
                                            </div>
                                        </div></div>
                                    <div class="row33">
                                        <div class="inn1">
                                            <div class="inn2"><img src="../images/style/pixel_trans.gif" alt="" width="1" height="1"></div>
                                        </div>
                                    </div>
                                </div>

                                <!-- eof: featured products  -->
                            </div>

                            <br>


                        </div>

                        <!--eof content_center-->

                        <div class="clear"></div>

                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</c:if>