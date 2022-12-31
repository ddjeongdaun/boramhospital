<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>진료예약</title>
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
			<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp"%>
			</div>
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="joinInsert">
    			<form name="regFrm" id="regFrm" method="post" action="/member/reservationNext">
    				<table id="regFrmTbl" style="width:800px;">
    					<caption>진료 예약 하기</caption>
    					<tbody>
    						<tr>
    							<td class="req">이름</td>
    							<td>${vo.uName }</td>
    							<td>&nbsp;</td>
    						</tr>
    						
    						<tr>
								<td class="req">진료과번호</td>
								<td>
									<select id="deptno" name="deptno" class="frmDropMenu">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>5</option>
											<option>6</option>
											<option>7</option>
											<option>8</option>
									</select>
								</td>
								<td><span>1 : 흉부외과<br>
								2 : 산부인과<br>
								3 : 신경외과<br>
								5 : 정신의학과<br>
								6 : 소아청소년과<br>
								7 : 재활의학과<br>
								8 : 정형외과
								</span></td>
							</tr>
    						
    						<tr>
    							<td colspan="4">진료받을 진료과를 선택하세요.</td>
    						</tr>
    						
    						<tr>
    							<td colspan="3">
    								<button type="submit"" id="joinSbmBtn" class="frmBtn">다음</button>
    							</td>
    						</tr>
    					</tbody>
    				</table>
    			
    			</form>
    			<!-- form[name=regFrm] -->
    			
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<%@ include file="../ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->

</body>

</html>