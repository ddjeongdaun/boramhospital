<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>진료예약 관리 페이지</title>
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
    					<caption>진료예약 관리 페이지</caption>
    					<tbody>
    						<tr>
    							<td class="req">환자id</td>
    							<td>${dto.memId}</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">담당의료진id</td>
    							<td>${dto.docId}</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td class="req">진료예약내용</td>
    							<td>${dto.reservation}</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td class="req">예약일자</td>
    							<td>
    							<fmt:formatDate value="${dto.regdate }" pattern="yyyy-MM-dd"/>
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
    							<td colspan="3">
    								<button type="button" class="frmBtn" onclick="location.href='/admin/manageReservation'">진료예약목록</button>
    								<button type="button" class="frmBtn" onclick="location.href='/admin/deleteReservation?no=${dto.no}'">진료삭제</button>
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