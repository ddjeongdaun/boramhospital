<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String uId_Session_HTmp = (String)session.getAttribute("uId_Session"); 

%>    

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더템플릿</title>
</head>
<body>

    	<header id="header" class="dFlex"> 	<!-- 로고, GNB -->
    		<div id="headerLogo">
    			<a href="/"><img src="/resources/images/BORAM.png"/></a>
    			<!-- <a href="/" style="font-size: 200%; color: #00009b; font-weight: bold;">hospital</a> -->
    		</div>
    		<nav id="gnb">
    		
    			<ul id="mainMenu" class="dFlex">
    			<c:if test="${empty sessionScope.uId_Session}">
    				<li class="mainLi"><a href="/">HOME</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/login">로그인</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/joinAgreement">회원가입</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/bbs/list">게시판</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/admin/adminMain">관리자모드</a></li>
    			</c:if>
    				
    			<c:if test="${!empty sessionScope.uId_Session}">
    			
    				<li class="mainLi"><a href="/">HOME</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/logout">로그아웃</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/member/myPage">마이페이지</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/bbs/list">게시판</a></li>
    				<li>|</li>
    				<li class="mainLi"><a href="/admin/adminMain">관리자모드</a></li>
    			</c:if>
    		
    			</ul>
    			
    		</nav>
    	</header>
    	<!--  header#header  -->
    	<hr class="sepLine">
    	
</body>
</html>