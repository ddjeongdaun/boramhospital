<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인영역 LNB 메뉴 </title>
</head>
<body>

	<nav id="mainLNB">
		<ul id="lnbMainMenu">
    	<!-- 회원/마이페이지 -->
    	<c:if test="${!empty gnbParam}">
    		<c:if test="${gnbParam == true }">
		    		<li class="lnbMainLi"><a href="/member/passwordCheck">회원정보</a></li>
				<li class="lnbMainLi"><a href="/member/reservation">진료예약</a></li>
				<li class="lnbMainLi"><a href="/member/reservationList">예약내역</a></li>
				<li class="lnbMainLi"><a href="/member/memberQuit">회원탈퇴</a></li>
    		</c:if>
    		<c:if test="${gnbParam == false }">
		    	<li class="lnbMainLi"><a href="/doctor/reservation">진료내역</a></li>
				<li class="lnbMainLi"><a href="/doctor/passwordCheck">회원정보</a></li>
				<li class="lnbMainLi"><a href="/doctor/memberQuit">회원탈퇴</a></li>
    		</c:if>
		</c:if>  		     		 
    	<c:if test="${empty gnbParam}">
    	
    			<c:if test="${adminCheck == true }">	<!-- 관리자 로그인 -->
		    		<li class="lnbMainLi"><a href="/admin/manageMember">회원 관리</a></li>
					<li class="lnbMainLi"><a href="/admin/manageDoctor">의료진 관리</a></li>
					<li class="lnbMainLi"><a href="/admin/manageDepartment">진료과 관리</a></li>
					<li class="lnbMainLi"><a href="/admin/manageReservation">진료내역 관리</a></li>
    			</c:if>
    			
    			<!-- 비회원/메인 -->
    			<c:if test="${adminCheck != true }">
    				<c:if test="${!empty boardParam}">
	    				<li class="lnbMainLi"><a href="/bbs/list">Q/A</a></li>
						<li class="lnbMainLi"><a href="/bbs/notice">공지사항</a></li>
    				</c:if>
    				
	    			<c:if test="${empty boardParam }">
			    		<li class="lnbMainLi"><a href="/">메인</a></li>
			    		<li class="lnbMainLi"><a href="/main/info">병원안내</a></li>
						<li class="lnbMainLi"><a href="/main/dept">진료과</a></li>
						<li class="lnbMainLi"><a href="/main/doctor">의료진</a></li>
						<li class="lnbMainLi"><a href="/main/load">오시는길</a></li>
					</c:if>
    			</c:if>
		</c:if>
    	
		</ul>
	</nav>
</body>
</html>