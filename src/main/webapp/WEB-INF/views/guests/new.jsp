<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<div class="new_guest">
			<div class="guest_form">
				<form method="POST" action="<c:url value='/guests/create' />">
		       		<c:import url="guest_form.jsp" />
		   		</form>
	   		</div>
   		</div>
	</c:param>
</c:import>