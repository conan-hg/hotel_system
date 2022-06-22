<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br /><br />
        <c:forEach var="error" items="${errors}">
             <c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<br /><br />
<label for="room_type">部屋のタイプ</label><br />
<select name="room_type">
	<option value="0"<c:if test="${booking.room_type == 0}">selected</c:if>>-------</option>
    <option value="1"<c:if test="${booking.room_type == 1}">selected</c:if>>Aタイプ</option>
    <option value="2"<c:if test="${booking.room_type == 2}">selected</c:if>>Bタイプ</option>
    <option value="3"<c:if test="${booking.room_type == 3}">selected</c:if>>Cタイプ</option>
</select>
<br /><br />

<label for="number_of_people">宿泊人数</label><br />
<label for="adult_people">大人</label><br />
<select name="adult_people">
	<option value="0"<c:if test="${booking.adult_people == 0}">selected</c:if>>-------</option>
    <option value="1"<c:if test="${booking.adult_people == 1}">selected</c:if>>0名</option>
    <option value="2"<c:if test="${booking.adult_people == 2}">selected</c:if>>1名</option>
    <option value="3"<c:if test="${booking.adult_people == 3}">selected</c:if>>2名</option>
</select>
<br />
<label for="child_people">小人（～7歳）</label><br />
<select name="child_people">
	<option value="0"<c:if test="${booking.child_people == 0}">selected</c:if>>-------</option>
	<option value="1"<c:if test="${booking.child_people == 1}">selected</c:if>>0名</option>
    <option value="2"<c:if test="${booking.child_people == 2}">selected</c:if>>1名</option>
    <option value="3"<c:if test="${booking.child_people == 3}">selected</c:if>>2名</option>
</select>
<br /><br />
<p>Aタイプ: 大人7,000円    小人4,000円</p>
<p>Bタイプ: 大人14,000円   小人8,000円</p>
<p>Cタイプ: 大人21,000円  小人12,000円</p>
<br />

<label for="check_in_date">日程</label><br />
<label>＜チェックイン＞</label><br />
<input type="date" name="check_in_date" value="<fmt:formatDate value='${booking.check_in_date}' pattern='yyyy-MM-dd'/>" /><br />
<label>＜チェックアウト＞</label><br />
<input type="date" name="check_out_date" value="<fmt:formatDate value='${booking.check_out_date}' pattern='yyyy-MM-dd' />" />
<br /><br /><br />

<label for="content">ご宿泊に当たって<br />ご質問がありましたら、<br />ご記入ください。</label><br />
<input type="text" name="content" value="${booking.content}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>