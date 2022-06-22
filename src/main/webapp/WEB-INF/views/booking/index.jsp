<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:import url="../layout/app_02.jsp">
	<c:param name="content">
   		<c:if test="${flush != null}">
			<div id="flush_success">
			    <c:out value="${flush}"></c:out>
		    </div>
		</c:if>
   		<div class="booking_content">
   		<div class="booking_content_title">
   			<h1>予約一覧</h1>
   		</div>
		<br />
   		<div class="booking_table">
   			<div class="booking_list_top">
   			<table>
   				<tr>
   				<c:if test="${boss == 1}">
   					<td class="booking_guest_id">予約者</td>
   				</c:if>
                	<td class="booking_room_type">部屋のタイプ</td>
                    <td class="booking_check_in_date">チェックイン</td>
                    <td class="booking_check_out_date">チェックアウト</td>
                    <td class="booking_adult_people">大人</td>
                    <td class="booking_child_people">小人</td>
                    <td class="booking_action">詳細</td>
                </tr>
   			</table>
   			</div>
   			<div class="booking_list_content">
   			<table>
	            <tbody>
	                <c:forEach var="booking" items="${booking}" varStatus="status">
                    <tr class="row${status.count % 2}">
                    <c:if test="${boss == 1}">
   						<td class="booking_guest_id"><c:out value="${booking.guest.name}" /></td>
   					</c:if>
                        <td class="booking_room_type">
                        	<c:if test="${booking.room_type == 1}">Aタイプ</c:if>
                           	<c:if test="${booking.room_type == 2}">Bタイプ</c:if>
                           	<c:if test="${booking.room_type == 3}">Cタイプ</c:if>
                        </td>
                        <td class="booking_check_in_date"><fmt:formatDate value='${booking.check_in_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="booking_check_out_date"><fmt:formatDate value='${booking.check_out_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="booking_adult_people"><c:out value="${booking.adult_people}" /></td>
                        <td class="booking_child_people"><c:out value="${booking.child_people}" /></td>
                        <td class="booking_action">
                        <c:choose>
                        	<c:when test="${booking.delete_flag == 1}">
                        		取消
                        	</c:when>
                        	<c:otherwise>
                        		<a href="<c:url value='/booking/show?id=${booking.id}' />">詳細へ</a>
                        	</c:otherwise>
                        </c:choose>
                        </td>
                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	        </div>
	    </div>
	    </div>
    </c:param>
</c:import>