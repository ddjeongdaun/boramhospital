<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <link rel="stylesheet" href="style/style_Common.css">
    <link rel="stylesheet" href="style/style_Template.css">
    <script src="source/jquery-3.6.0.min.js"></script>
    <script src="script/script.js"></script>
</head>
<body>
    <div id="wrap">
    	
    	<!--  헤더템플릿 시작 -->
		<%@ include file="ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="ind/mainLnbTmp.jsp" %>
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents">
    			<br>
    			<h1 style="color: #00009b; text-align: center;">&nbsp;[보람병원에 오신것을 환영합니다]</h1>
    			<h2 id="indexGuideMsg">
    			<img style="width: 780px; height: 280px;" src="/resources/images/out1.jpg">
    			<br>
    			<c:if test="${empty uId_Session }">
    				<br>
    				건강과 행복을 위해 노력하는 병원
    				<br> 
					당신의 더 나은 내일을 위해, 망설이지않고 도전하겠습니다.<br> <br> <br> 
    			</c:if>
    			<c:if test="${!empty uId_Session }">
	    			${uId_Session } 님이 로그인했습니다.
   				</c:if>
    			</h2>
    		<br><br><br>
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<%@ include file="ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->

</body>
</html>