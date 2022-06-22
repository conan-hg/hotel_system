<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<h2>ログイン</h2>
<c:if test="${hasError}">
	<div id="flush_error">氏名かパスワードが間違っています。</div>
</c:if>
<br />

<label for="name">氏名</label><br />
<input type="text"name="name"  />
<br /> <br />

<label for="password">パスワード</label><br />
<input type="password" name="password" />
<br /> <br />

<div class="login_button">
	<c:if test="${button == 1 }">
		<input type="hidden" name="_token" value="${_token}" />
		<button type="submit">ログインして予約</button>
	</c:if>

	<c:if test="${button == 0 }">
		<input type="hidden" name="_token" value="${_token}" />
		<button type="submit">ログインして予約一覧</button>
	</c:if>
</div>
