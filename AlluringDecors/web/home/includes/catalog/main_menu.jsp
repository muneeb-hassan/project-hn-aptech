<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul id="nav">
    <li class="level0 <c:choose><c:when test="${empty param.cmd}">active</c:when></c:choose>"><span><a class="css3" href="/">Home</a></span></li>
    <li class="level0 <c:choose><c:when test="${param.cmd == 'project'}">active</c:when></c:choose>"><span><a class="css3" href="?cmd=project">Projects</a></span></li>
    <li class="level0 <c:choose><c:when test="${param.cmd == 'feedback'}">active</c:when></c:choose>"><span><a class="css3" href="?cmd=feedback">Feedback</a></span></li>
    <li class="level0 <c:choose><c:when test="${param.cmd == 'contactus'}">active</c:when></c:choose>"><span><a class="css3" href="?cmd=contactus">Contact US</a></span></li>
    <li class="last level0 <c:choose><c:when test="${param.cmd == 'faq'}">active</c:when></c:choose>"><span><a class="css3" href="?cmd=faq">FAQs</a></span></li>
</ul>