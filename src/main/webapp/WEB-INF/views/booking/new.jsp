<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app_01.jsp">
	<c:param name="content">
		<c:if test="${flush != null}">
			<div id="flush_success">
			    <c:out value="${flush}"></c:out>
		    </div>
		</c:if>
   		<div class="new_booking_form">
   			<div class="booking_content">
   				<form method="POST" action="<c:url value='/booking/confirm' />">
   					<c:import url="booking_form.jsp" />
   				</form>
   			</div>
   		</div>
	</c:param>
</c:import>
