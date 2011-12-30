<c:if test="${not empty sessionScope['message']}">
    <ul class="messages">
        <li class="error-msg">
            <ul>
                <li><span><c:out value="${sessionScope['message']}" /></span></li>
            </ul>
        </li>
    </ul>
    <% session.removeAttribute("message"); %>
</c:if>