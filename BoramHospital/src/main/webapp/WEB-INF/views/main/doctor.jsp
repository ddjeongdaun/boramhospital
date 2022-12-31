<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>의료진 소개</title>
    <link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
    <style type="text/css">
    	img#doc{
    		width: 150px;
    		height: 150px;
    	}
    	div#time {
    display: inline-block;
    width: 350px;
    font-size: 73%;
}
    </style>
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
    			<h1 style="color: #00009b; text-align: center;">&nbsp;[의료진 소개]</h1>
    			<h2 id="indexGuideMsg">
    				<Div id="doctor" style="margin: 10px;">
	    				<div id="time">
		    				<img src="/resources/images/icon (6).png" id="doc"><br><br>
							<label>진료과 : </label>
							<span id="sp1">흉부외과</span><br>
							<label>의료진 : </label>
							<span id="sp1">김연아</span><br>
							<label>직급 : </label>
							<span id="sp1">진료과장</span><br>
						</div>
	    				<div id="time">
		    				<img src="/resources/images/icon (6).png" id="doc"><br><br>
							<label>진료과 : </label>
							<span id="sp1">산부인과</span><br>
							<label>의료진 : </label>
							<span id="sp1">김동글</span><br>
							<label>직급 : </label>
							<span id="sp1">전문의</span><br>
						</div>
					</Div>
					<br><br>
					
					<Div id="doctor" style="margin: 10px;">
	    				<div id="time">
		    				<img src="/resources/images/icon (6).png" id="doc"><br><br>
							<label>진료과 : </label>
							<span id="sp1">신경외과</span><br>
							<label>의료진 : </label>
							<span id="sp1">김연아</span><br>
							<label>직급 : </label>
							<span id="sp1">진료과장</span><br>
						</div>
	    				<div id="time">
		    				<img src="/resources/images/icon (6).png" id="doc"><br><br>
							<label>진료과 : </label>
							<span id="sp1">정신의학과</span><br>
							<label>의료진 : </label>
							<span id="sp1">홍길동</span><br>
							<label>직급 : </label>
							<span id="sp1">전문의</span><br>
						</div>
					</Div>
					<br>
					
					<Div id="doctor" style="margin: 10px;">
	    				<div id="time">
		    				<img src="/resources/images/icon (6).png" id="doc"><br><br>
							<label>진료과 : </label>
							<span id="sp1">소아청소년과</span><br>
							<label>의료진 : </label>
							<span id="sp1">김지현</span><br>
							<label>직급 : </label>
							<span id="sp1">진료과장</span><br>
						</div>
	    				<div id="time">
		    				<img src="/resources/images/icon (6).png" id="doc"><br><br>
							<label>진료과 : </label>
							<span id="sp1">재활의학과</span><br>
							<label>의료진 : </label>
							<span id="sp1">정영상</span><br>
							<label>직급 : </label>
							<span id="sp1">진료과장</span><br>
						</div>
    				</Div>
    			</h2>
					<br><br><br><br><br>
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    
		<%@ include file="../ind/footerTmp.jsp" %>
    </div>
</body>

</html>