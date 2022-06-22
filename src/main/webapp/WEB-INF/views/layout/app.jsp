<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>予約システム</title>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" media="screen and (min-width:961px)" href="<c:url value='/css/pc_style.css' />">
        <link rel="stylesheet" media="screen and (min-width:600px) and (max-width:960px)" href="<c:url value='/css/tb_style.css' />">
        <link rel="stylesheet" media="screen and (max-width:599px)" href="<c:url value='/css/sp_style.css' />">
    </head>
    <body>
    	<div id="wrapper">
			<div id="gamen">
    		<div id="header">
    			<div class="hamburger-menu">
			        <input type="checkbox" id="menu-btn-check">
			        <label for="menu-btn-check" class="menu-btn"><span></span></label>
			        <div class="menu-content">
				      	<ul>
				      		<li class="header_menu_0"><h2><a href="<c:url value='/index.html' />">top</a></h2></li>
			    			<li class="header_menu_1"><h2><a href="<c:url value='/new/or/login' />">予約</a></h2></li>
			    			<li class="header_menu_2"><h2><a href="<c:url value='/login' />">予約確認</a></h2></li>
			    			<li class="header_menu_3"><h2><a href="<c:url value='/faq/index' />">問い合わせ</a></h2></li>
				      	</ul>
				    </div>
			    </div>
				<div class="pc_header">
					<div class="header_menu_0"><h2><a href="<c:url value='/index.html' />">top</a></h2></div>&nbsp;
	    			<div class="header_menu_1"><h2><a href="<c:url value='/new/or/login' />">予約</a></h2></div>&nbsp;
	    			<div class="header_menu_2"><h2><a href="<c:url value='/login' />">予約確認</a></h2></div>&nbsp;
	    			<div class="header_menu_3"><h2><a href="<c:url value='/faq/index' />">問い合わせ</a></h2></div>&nbsp;
				</div>
    		</div>
    		<div id="content">
		            ${param.content}
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