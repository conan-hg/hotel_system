<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app_02.jsp">
	<c:param name="content">
	    <div class="show_booking">
	    <div class="booking_content_title">
			<h1>予約一覧</h1>
		</div>
	       <c:choose>
	        <c:when test="${booking != null}">
	        <div class="viewer_container">
	        <table>
	         <tbody>
	         <c:if test="${boss == 1}">
	         	<tr class="viewer_content_0">
	                 <th>予約者</th>
	                 <td><c:out value="${booking.guest.name}" /></td>
	             </tr>
				</c:if>
	             <tr class="viewer_content_1">
	                 <th>お部屋のタイプ</th>
	                 <td>
	                 	<c:if test="${booking.room_type == 1}">Aタイプ</c:if>
	                 	<c:if test="${booking.room_type == 2}">Bタイプ</c:if>
	                 	<c:if test="${booking.room_type == 3}">Cタイプ</c:if>
	                 </td>
	             </tr>
	             <tr class="viewer_content_2">
	                 <th>チェックイン</th>
	                 <td><fmt:formatDate value="${booking.check_in_date}" pattern="yyyy-MM-dd" /></td>
	             </tr>
	             <tr class="viewer_content_3">
	                 <th>チェックアウト</th>
	                 <td><fmt:formatDate value="${booking.check_out_date}" pattern="yyyy-MM-dd" /></td>
	             </tr>
	             <tr class="viewer_content_4">
	                 <th>大人</th>
	                 <td>
	                 	<c:if test="${booking.adult_people == 1}">0名</c:if>
	                 	<c:if test="${booking.adult_people == 2}">1名</c:if>
	                 	<c:if test="${booking.adult_people == 3}">2名</c:if>
	                 </td>
	             </tr>
	             <tr class="viewer_content_5">
	                 <th>小人（～7歳）</th>
	                 <td>
	                 	<c:if test="${booking.child_people == 1}">0名</c:if>
	                 	<c:if test="${booking.child_people == 2}">1名</c:if>
	                 	<c:if test="${booking.child_people == 3}">2名</c:if>
	                 </td>
	             </tr>
	             <tr class="viewer_content_6">
	                 <th>ご質問内容</th>
	                 <td><c:out value="${booking.content}" /></td>
	             </tr>
	         </tbody>
	     </table>
	     </div>

	     <c:if test="${sessionScope.login_guest.id == booking.guest.id || sessionScope.login_guest.getAdmin_flag() == 0}">
	         <p><a href="<c:url value="/booking/edit?id=${booking.id}" />">予約を変更する→</a></p>
	     </c:if>
	        </c:when>
	        <c:otherwise>
	     	<h2>お探しのデータは見つかりませんでした。</h2>
			</c:otherwise>

	    </c:choose>
	    </div>
    </c:param>
</c:import>