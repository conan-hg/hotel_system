<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br /><br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<br /><br />
<label for="name">氏名</label><br />
<input type="text" name="name" value="${guest.name}" />
<br /><br />

<label for="password">パスワード</label><br />
<input type="text" name="password" value="${guest.password}" />
<br /><br />

<label for="phone">電話番号</label><br />
<input type="text" name="phone" value="${guest.phone}" />
<br /><br />

<label for="mail">メールアドレス</label><br />
<input type="text" name="mail" value="${guest.mail}" />
<br /><br />


<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>
