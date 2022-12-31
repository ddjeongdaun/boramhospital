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
	<script type="text/javascript">
	$(function(){
	   	$("#joinSbmBtn").click(function(){		
	   		fnJoinSbm();		
	   	});

	   	function fnJoinSbm() {
	   		let reservation = $("#reservation").val().trim();		
	   		$("#reservation").val(reservation);
	   		let listResult = $("#listResult").val().trim();		
	   		$("#listResult").val(listResult);
	   		
	   		if(listResult=="false"){
	   			alert("진료가능한 의료진이 없습니다.");
	   			return;
	   		} else if(reservation == "") {
	   			alert("예약내역을 입력해주세요.");
	   			$("#reservation").focus();
	   			return;
	   		} else {
	   			let chkSbmTF = confirm("진료예약 하시겠습니까?");
	   			if (chkSbmTF) {
	   				$("#regFrm").submit();
	   			}
	   		}
	   	}
	});

    </script>
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
    			<form name="regFrm" id="regFrm" method="post" action="/member/reservationProc">
    				<table id="regFrmTbl" style="width:800px;">
    					<caption>진료 예약 하기</caption>
    					<tbody>
    						<tr>
    							<td colspan="4"> 진료받을 의료진을 선택하세요.</td>
    						</tr>
    						<input type="hidden" value="${listResult }" id="listResult" name="listResult">
    						<tr>
								<td class="req">의료진</td>
								<td>
									<c:if test="${empty list }">
										<span>진료가능한 의료진이 없습니다.</span>
									</c:if>
									<c:if test="${!empty list }">
										<c:forEach var="doc" items="${list }">
											<input type="radio" id="docId" name="docId" value="${doc.uId }"
											style="margin: 2px;">${doc.uName }&nbsp;
										</c:forEach>
									</c:if>
								</td>
								<td></td>
							</tr>
							
							<tr>
    							<td colspan="4"> 진료예약 내용을 간단히 입력하세요</td>
    						</tr>
    						
    						<tr>
    							<td class="req">진료예약 내용</td>
    							<td><input type="text" id="reservation" name="reservation"></td>
    						</tr>
							
    						<tr>
    							<td colspan="3">
    								<button type="button" id="joinSbmBtn" class="frmBtn">진료예약</button>
    								<button type="reset" class="frmBtn">다시쓰기</button>
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