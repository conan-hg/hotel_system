<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app_02.jsp">
	<c:param name="content">
		<div class="booking_form">
			<c:choose>
				<c:when test="${booking != null}">
					<c:if test="${boss == 1}">
						<p>予約者：<c:out value="${booking.guest.name}" />様</p>
					</c:if>

					<form method="POST" action="<c:url value='/booking/update' />">
						<c:import url="booking_form.jsp" />
					</form>
					<br />

					<p><a href="#" onclick="confirmDestroy()">この予約を削除する→</a></p>

					<form method="POST" action="<c:url value='/booking/destroy' />">
						<input type="hidden" name="_token" value="${_token}" />
					</form>
					<script>
						function confirmDestroy() {
							if (confirm("本当に削除してもよろしいですか？")) {
								document.forms[1].submit();
							}
						}
					</script>
				</c:when>
				<c:otherwise>
					<h2>お探しのデータは見つかりませんでした。</h2>
				</c:otherwise>
			</c:choose>
		</div>
    </c:param>
</c:import>
















