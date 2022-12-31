<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>진료과 안내</title>
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
    			<h1 style="color: #00009b; 	text-align: center;">&nbsp;[진료과 안내]</h1>
    			<h2 id="indexGuideMsg">
    				<div id="time">
	    				<img src="/resources/images/icon (6).png"><br>
						<span id="sp1">흉부외과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (5).png"><br>
						<span id="sp1">산부인과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (8).png"><br>
						<span id="sp1">신경외과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (4).png"><br>
						<span id="sp1">정신의학과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (9).png"><br>
						<span id="sp1">소아청소년과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (7).png"><br>
						<span id="sp1">재활의학과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (2).png"><br>
						<span id="sp1">정형외과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (10).png"><br>
						<span id="sp1">피부과</span><br><br>
					</div>
    				<div id="time">
	    				<img src="/resources/images/icon (11).png"><br>
						<span id="sp1">병리과</span><br><br>
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