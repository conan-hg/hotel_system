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
        <link rel="stylesheet" media="screen and (max-width:960px)" href="<c:url value='/css/tb_style.css' />">
        <link rel="stylesheet" media="screen and (max-width:600px)" href="<c:url value='/css/sp_style.css' />">
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
				      		<li class="header_menu_4"><c:out value="${sessionScope.login_guest.name}" />　様</li>
							<li class="header_menu_6"><a href="<c:url value='/booking/new' />">戻る</a></li>
				      	</ul>
				    </div>
			    </div>
    			<div class="pc_header">
					<div class="header_menu_4"><c:out value="${sessionScope.login_guest.name}" />　様</div>
					<div class="header_menu_6"><a href="<c:url value='/booking/new' />">戻る</a></div>
				</div>
			</div>
	        <div id="content">
	        <div class="show_booking">
	        <div class="booking_content_title">
    			<h1>予約確認</h1>
    		</div>
	            <div class="viewer_container">
	            <table>
		            <tbody>
		                <tr class="viewer_content_1">
		                    <th>お部屋のタイプ</th>
		                    <td>
		                    	<c:if test="${room_type == 1}">Aタイプ</c:if>
		                    	<c:if test="${room_type == 2}">Bタイプ</c:if>
		                    	<c:if test="${room_type == 3}">Cタイプ</c:if>
		                    </td>
		                </tr>
		                <tr class="viewer_content_2">
		                    <th>チェックイン</th>
		                    <td><c:out value="${check_in_date}" /></td>
		                </tr>
		                <tr class="viewer_content_3">
		                    <th>チェックアウト</th>
		                    <td><c:out value="${check_out_date}" /></td>
		                </tr>
		                <tr class="viewer_content_4">
		                    <th>大人</th>
		                    <td>
		                    	<c:if test="${adult_people == 1}">0名</c:if>
		                    	<c:if test="${adult_people == 2}">1名</c:if>
		                    	<c:if test="${adult_people == 3}">2名</c:if>
		                    </td>
		                </tr>
		                <tr class="viewer_content_5">
		                    <th>小人（～7歳）</th>
		                    <td>
		                    	<c:if test="${child_people == 1}">0名</c:if>
		                    	<c:if test="${child_people == 2}">1名</c:if>
		                    	<c:if test="${child_people == 3}">2名</c:if>
		                    </td>
		                </tr>
		                <tr class="viewer_content_6">
		                    <th>ご質問内容</th>
		                    <td><c:out value="${content}" /></td>
		                </tr>
		            </tbody>
		        </table>
		        </div>

		        <div class="booking_price">
		        	<p>宿泊合計金額</p>
					<p><c:out value="${booking_price}"/>円</p>
		        </div>
		        <div class="finish_button">
		        	<p>※こちらでよろしければ、<span class="br">予約ボタンを押して下さい。</span></p>
		        	 <form method="POST" action="<c:url value='/booking/create' />">
            			<input type="hidden" name="_token" value="${_token}" />
						<button type="submit">予約する</button>
					</form>
		        </div>
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