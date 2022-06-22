<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>新規予約ページ</title>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" media="screen and (min-width:961px)" href="<c:url value='/css/pc_style.css' />">
        <link rel="stylesheet" media="screen and (min-width:600px) and (max-width:960px)" href="<c:url value='/css/tb_style.css' />">
        <link rel="stylesheet" media="screen and (max-width:599px)" href="<c:url value='/css/sp_style.css' />">
    </head>
    <body>
    	<div id="wrapper">
			<div id="gamen">
    		<div id="header"></div>
    		<div id="content">
    			<div class="finish_content">
    				<div class="text">
    					<p>この度はご予約頂き、<span class="br">誠にありがとうございます。</span></p>
				    	<p>従業員一同、<span class="br">お客様がご来館される日を</span><span class="br">心からお待ちしております。</span></p>
    				</div>
					<a href="<c:url value='/logout' />">ホームへ戻る</a>
    			</div>
    		</div>
			</div>
    		<div class="footer">
				<div class="inquiry">
					<p>shibuya, hotel</p>
					<p>123-1234 東京都渋谷区渋谷1－1</p>
					<p>TEL : 03-1234-1234</p>
					<p>MAIL : info@shibuya-hotel.com</p>
				</div>
			</div>
    	</div>
    </body>
</html>