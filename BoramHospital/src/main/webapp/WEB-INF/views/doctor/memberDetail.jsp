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
    		
    			<form name="regFrm" id="regFrm" method="post" action="/admin/registerMember">
    			
    				<table id="regFrmTbl">
    					<caption>환자 정보</caption>
    					<tbody>
    						<tr>
    							<td class="req">아이디</td>
    							<td>${vo.uId }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">이름</td>
    							<td>${vo.uName }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td>성별</td>
    							<td>
    								<label>
    									남 <input type="radio" name="gender" value="1"
    									<c:if test="${vo.gender eq '1' }">
    										checked
    									</c:if>
    									>
    								</label>
    								<label>
    									여 <input type="radio" name="gender" value="2"
    									<c:if test="${vo.gender eq '2' }">
    										checked
    									</c:if>
    									>
    								</label>
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td>생년월일</td>
    							<td>${vo.uBirthday }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td>직업</td>
    							<td>    								
    								<select name="uJob" id="uJob" class="frmDropMenu">
    									<option value=""> - 선택 - </option>
    									<option
    									<c:if test="${vo.uJob eq '교수' }">selected</c:if>
    									>교수</option>
    									<option
    									<c:if test="${vo.uJob eq '학생' }">selected</c:if>
    									>학생</option>
    									<option
    									<c:if test="${vo.uJob eq '회사원' }">selected</c:if>
    									>회사원</option>
    									<option
    									<c:if test="${vo.uJob eq '공무원' }">selected</c:if>
    									>공무원</option>
    									<option
    									<c:if test="${vo.uJob eq '자영업' }">selected</c:if>
    									>자영업</option>
    									<option
    									<c:if test="${vo.uJob eq '전문직' }">selected</c:if>
    									>전문직</option>
    									<option
    									<c:if test="${vo.uJob eq '주부' }">selected</c:if>
    									>주부</option>
    									<option
    									<c:if test="${vo.uJob eq '무직' }">selected</c:if>
    									>무직</option>
    								</select>
    							</td>
    							<td></td>
    						</tr>
    						<tr>
    							<td colspan="3">
    								<button type="button" class="frmBtn" onclick="history.back()">뒤로가기</button>
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