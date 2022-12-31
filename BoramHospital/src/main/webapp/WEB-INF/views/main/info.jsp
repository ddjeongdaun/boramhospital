<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>병원소개</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>

<body>

<div id="wrap">
    	
		<%@ include file="../ind/headerTmp.jsp" %>
    	
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp" %>
    		</div>
    		
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents">
    			<br>
    			<h1 style="color: #00009b; text-align: center;">&nbsp;[병원안내]</h1>
    			<h2 id="indexGuideMsg">
    				<img style="width: 780px; height: 280px;" src="/resources/images/out1.jpg">
    				<br><br>
    				<div id="time">
					<span id="sp1">평일</span><br><br>
					<span id="sp2">오전9시~오후6시</span><br>
					<span id="sp2">진료 30분전까지 접수</span>
					</div>

					<div id="time">
					<span id="sp1">토요일</span><br><br>
					<span id="sp2">오전9시~오후1시</span><br>
					<span id="sp2">진료 30분전까지 접수</span>
					</div>
					
					<div id="time" >
					<span id="sp1">일요일</span><br><br>
					<span id="sp2">응급진료</span><br>
					<span id="sp2">수술 및 분만 가능</span>
					</div>
					
    			</h2>
					<br><br><br><br><br>
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    
		<%@ include file="../ind/footerTmp.jsp" %>
    </div>
</body>

</html>