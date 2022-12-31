<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원정보수정</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	
</head>

<body>
    <div id="wrap">
    	
    	<!--  헤더템플릿 시작 -->
		<%@ include file="../ind/headerTmp.jsp" %>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main" class="dFlex">
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="joinInsert">
    		
    			<form name="regFrm" id="regFrm">
    			
    				<table id="regFrmTbl">
    					<caption>의료진관리 - 의료진 회원정보 수정</caption>
    					<tbody>
    						<tr>
    							<td class="req">아이디</td>
    							<td>${dto.uId }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">비밀번호</td>
    							<td>
    								<input type="button" value="비밀번호 초기화" id="resetPw" onclick="location.href='/admin/resetDoctorPw?num=${dto.num}'">
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td colspan="3">
    								<button type="button" class="frmBtn" onclick="location.href='/admin/manageDoctor'">의료진 목록</button>
    								<button type="button" class="frmBtn" onclick="location.href='/admin/deleteDoctor?uId=${dto.uId}'">의료진 삭제</button>
    							</td>
    						</tr>
    					</tbody>
    				</table>
    			
    			</form>
    			
    		</div>
    		    	
    	</main>
    
		<%@ include file="../ind/footerTmp.jsp" %>
        
    </div>

</body>

</html>