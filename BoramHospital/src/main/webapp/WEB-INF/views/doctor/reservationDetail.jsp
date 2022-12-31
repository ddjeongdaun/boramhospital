<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>진료예약 상세정보</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(function(){
   	
   	/* 진료수정 버튼 전송 실행 */	
   	$("#joinSbmBtn").click(function(){		
   		fnJoinSbm();		
   	});

   	function fnJoinSbm() {
   		
   		let uPw = $("#uPw").val().trim();		
   		$("#uPw").val(uPw);		
   		let uPw_Re = $("#uPw_Re").val().trim();	
   		let uName = $("#uName").val().trim();
   		$("#uName").val(uName);
   		let uEmail_01 = $("#uEmail_01").val().trim();
   		let uEmail_02 = $("#uEmail_02").val().trim();
   		$("#uEmail").val(uEmail_01+"@"+uEmail_02);
   		let uBirthday = $("#uBirthday").val().trim();
   		
   		if (uName == "") {
   			alert("이름을 입력해주세요.");
   			$("#uName").focus();
   			return;
   		} else if (uEmail_01 == "") {
   			alert("이메일 주소를 입력해주세요.");
   			$("#uEmail_01").focus();
   			return;
   		} else if (uEmail_02 == "") {
   			alert("이메일 주소를 입력해주세요.");
   			$("#uEmail_02").focus();
   			return;
   		} else if (uBirthday != "" && isNaN(uBirthday)) {
   			// 생년월일 숫자유효성 검사
   			alert("생년월일은 숫자만 입력할 수 있습니다.");
   			$("#uBirthday").val("").focus();
   			return;
   		} else {
   			let chkSbmTF = confirm("회원수정하시겠습니까?");
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
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="joinInsert">
    		
    			<form name="regFrm" id="regFrm" method="post" action="/doctor/reservationUpdate">
    			
    				<table id="regFrmTbl">
    					<caption>진료내역 - 예약내역</caption>
    					<tbody>
    						<tr>
    							<td>환자성함</td>
    							<td>${dto.uName }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td colspan="3">
    								<button type="button" id="joinSbmBtn" class="frmBtn">회원정보수정</button>
    								<button type="reset" class="frmBtn">다시쓰기</button>
    								<button type="button" class="frmBtn" onclick="location.href='/admin/manageMember'">회원목록</button>
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