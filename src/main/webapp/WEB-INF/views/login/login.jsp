<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<div id="booking_login_menu">
			<div class="booking_login_menu">
			<form method="POST" action="<c:url value='/login' />">
				<c:import url="login_form.jsp" />
			</form>
			</div>
		</div>
	</c:param>
</c:import>