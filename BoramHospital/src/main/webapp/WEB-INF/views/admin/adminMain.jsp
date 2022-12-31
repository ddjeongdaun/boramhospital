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
    <link rel="stylesheet" href="/style/style_Common.css">
    <link rel="stylesheet" href="/style/style_Template.css">
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script src="/script/script.js"></script>
</head>
<body>
    <div id="wrap">
    	
    	<!--  헤더템플릿 시작 -->
		<%@ include file="../ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
	    		<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="../ind/mainLnbTmp.jsp" %>
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents">
    
    			<h1>Main</h1>
    
    			<h2 id="indexGuideMsg">
    			<c:if test="${!empty uId_Session }">
    				관리자 ${uId_Session } 님이 로그인했습니다.<br><Br><br>
    			</c:if>
    			</h2>
    		
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    
		<%@ include file="../ind/footerTmp.jsp" %>
    </div>
</body>
</html>