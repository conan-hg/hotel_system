<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    		<div class="toppage">
    		<div class="toppage_wrap">
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
			<c:if test="${flush != null}">
		        <div id="flush_success">
		            <c:out value="${flush}"></c:out>
		        </div>
		    </c:if>
		    <div class="heading">
		    	<h2 class="title">shibuya, <span class="br">hotel</span></h2>
		    </div>
		    </div>
		    </div>
		    <div class="concept_content">
		    	<div class="title">HOTEL</div>
		    	<div class="concept_text">
		    		<p>shibuya, hotelが構える東京都渋谷区・渋谷駅周辺は<br />
		    		常に最先端のビジネスを仕掛け続け、<span class="br">情報発信基地としても名高い街。</span><br />
		    		街にはビジネスの展開が期待されることから<span class="br">各業界の企業が集中し、</span><br />
		    		それを求めて毎日、多くの老若男女がこの街に訪れます。<br />
		    		そんな街に漂う雰囲気を取り込み、<span class="br">街に溶け込みながら、旅人をお迎えする。</span><br />
		    		そんなホテルです。</p>
		    	</div>
		    </div>
			<div class="room_content">
			<div class="room_content_wrap">
				<div class="title_cotent">
					<h1 class="title">ROOMS</h1>
					<div class="secondary_title">
						<p>shibuya, hotelではお客様の旅のスタイルに合わせ、</p>
						<p>3タイプの客室をご用意しております。</p>
						<p></p>
					</div>
				</div>
				<div class="room_a">
					<img class="img_a" alt="" src="https://cdn.pixabay.com/photo/2018/02/27/13/13/bedroom-3185433_1280.jpg">
					<div class="menu_a">
						<div class="text_title">
							<h1>タイプA</h1>
						</div>
						<div class="text_item">
							<div class="text_desc">
								<p>タイプAのお部屋は、<span class="br">当ホテルの魅力を最も気軽に楽しめる客室。</span><br />
									コンパクトでありながら、<span class="br">落ち着きと機能性を兼ね備えています。</span></p>
							</div>
							<div class="text_spec">
								<p>room size:19㎡</p>
								<p>capacity: 2</p>
								<p>bed: double bed</p>
								<p>price: 大人7,000円  小人4,000円</p>
							</div>
						</div>
					</div>
				</div>
				<div class="room_b">
					<img class="img_b" alt="" src="https://cdn.pixabay.com/photo/2017/02/04/11/28/hotel-2037166_1280.jpg">
					<div class="menu_b">
						<div class="text_title">
							<h1>タイプB</h1>
						</div>
						<div class="text_item">
							<div class="text_desc">
								<p>タイプBのお部屋は、<span class="br">シングルベットを2つご用意したツインルーム。</span><br />
								ご友人・ご家族との滞在も窮屈に感じない、<span class="br">ゆとりのある客室となっています。</span></p>
							</div>
							<div class="text_spec">
								<p>room size:19㎡</p>
								<p>capacity: 2</p>
								<p>bed: twin bed</p>
								<p>price: 大人14,000円  小人8,000円</p>
							</div>
						</div>
					</div>
				</div>
				<div class="room_c">
					<img class="img_c" alt="" src="https://cdn.pixabay.com/photo/2016/06/10/01/05/hotel-room-1447201_960_720.jpg">
					<div class="menu_c">
						<div class="text_title">
							<h1>タイプC</h1>
						</div>
						<div class="text_item">
							<div class="text_desc">
								<p>タイプCのお部屋は、<span class="br">クイーンサイズのベットが入った開放感のある客室。</span><br />
									オリジナルの家具が設えられた客室は、<br />
									インスピレーションと安らぎを<span class="br">同時に提供してくれる特別な空間です。</span></p>
							</div>
							<div class="text_spec">
								<p>room size:19㎡</p>
								<p>capacity: 2</p>
								<p>bed: queen bed</p>
								<p>price: 大人21,000円  小人12,000円</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="access_content">
				<div class="title">ACCESS</div>
				<div class="transportation">
					<div class="train">
						<div class="access_name">渋谷駅から</div>
						<div class="access_text">渋谷駅ハチ公改札から約徒歩10分</div>
					</div>
				</div>
			</div>
			<div class="top_footer">
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
