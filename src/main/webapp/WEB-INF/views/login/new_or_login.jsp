<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
	<c:if test="${flush != null}">
		<div id="flush_success">
		    <c:out value="${flush}"></c:out>
	    </div>
	</c:if>
		<div class="new_or_login_content">
			<div id="login_menu">
				<div class="login_content">
				<form method="POST" action="<c:url value='/new/or/login' />">
	          			<c:import url="login_form.jsp" />
	          	</form>
	          	</div>
			</div>
			<div id="new_guest">
				<div class="new_guest_content">
					<p>アカウントを<br />お持ちでない方は<br />こちらから</p>
					<br />
					<form method="GET" action="<c:url value='/guests/new' />">
	          			<input type="hidden" name="_token" value="${_token}" />
						<button type="submit">新規登録へ</button>
	          		</form>
				</div>
			</div>
		</div>
	</c:param>
</c:import>