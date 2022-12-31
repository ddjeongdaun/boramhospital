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
	<script type="text/javascript">
	$(function(){
   	// 필수입력 영역 배경색 적용
   	$("#regFrmTbl td.req").parent("tr").css({
   		"background-color": "rgba(128, 128, 128, 0.07)"
   	});
   	
   	// 선택된 Email 도메인 자동입력  
   	$("#regFrm select#emailDomain").change(function(){
   		// change 이벤트 핸들러 => value값이 변경되었을때 인식하는 이벤트
   		let emailDomain = $(this).val().trim();
   		$("input#uEmail_02").val(emailDomain);
   		if (emailDomain == "") {
   			$("input#uEmail_02").focus();
   		} else {
   			$("input#uEmail_01").focus();
   		}
   	});
   	
   	// 비밀번호 표시하기 
   	$("#wrap #regFrmTbl input#pwView").click(function(){
   		let chkTF = $(this).prop("checked");     ;     // YN => Yes or No,   TF => True or False
   		//alert("chkTF : " + chkTF);
   		if (chkTF) {
   			$("input#uPw").attr("type", "text");
   		} else {
   			$("input#uPw").attr("type", "password");
   		}
   	});
   	
   	// 비밀번호 / 비밀번호 확인 동일성 검사   +  유효성검사(정규표현식)
   	$("#uPw_Re").keyup(function(){ 
   		let uPw = $("#uPw").val();
   		let uPw_Re = $("#uPw_Re").val();
   		
   		// after( )메서드는 선택자로 지정된 요소 다음에 생성되는 요소를 만드는 기능
   		if (uPw != uPw_Re) {
   			$("span#pwChk").text("비밀번호가 다릅니다.");
   		} else {
   			$("span#pwChk").text("");
   		}
   		
   	});
   	
   	/* 회원수정 버튼 전송 실행 */	
   	$("#joinSbmBtn").click(function(){		
   		fnJoinSbm();		
   	});
   	
   	/* 폼실행 엔터키 이벤트 처리 */
   	$(window).keydown(function(){
   		let code = event.keyCode;
   		if (code == 13) return false;
   	});
   	
   	/* 폼실행 엔터키 이벤트 처리 */
   	$(window).keyup(function(){		
   		let code = event.keyCode;
   		//alert("code : " + code);
   		if (code == 13) fnJoinSbm();
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
   		
   		if (uPw == "") {
   			alert("비밀번호를 입력해주세요.");
   			$("#uPw").focus();
   			return;
   		} else if (uPw_Re == "" || uPw != uPw_Re) {
   			alert("비밀번호 일치여부를 확인해주세요.");
   			$("#uPw_Re").focus();
   			return;
   		} else if (uName == "") {
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
    		
    			<form name="regFrm" id="regFrm" method="post" action="/doctor/doctorModOK">
    			
    				<table id="regFrmTbl">
    					<caption>회원 정보 수정</caption>
    					<tbody>
    						<tr>
    							<td class="req">아이디</td>
    							<td>${dto.uId }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">패스워드</td>
    							<td>
    								<input type="password" name="uPw" id="uPw"
    								maxlength="20">
    								<input type="checkbox" id="pwView"> 비밀번호 보기
    							</td>
    							<td>
    								<span>영어소문자/숫자, _, @, $, 5~20 </span>
    								<!-- 공통비번1234 로 필 변경! -->
    							</td>
    						</tr>
    						<tr>
    							<td class="req">패스워드 확인</td>
    							<td>
    								<input type="password" id="uPw_Re"
    								maxlength="20">
    								<span id="pwChk"></span>
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">이름</td>
    							<td>
    								<input type="text" name="uName" id="uName"
    								maxlength="20" value="${dto.uName }">
    							</td>
    							<td></td>
    						</tr>
    						<tr>
    							<td class="req">진료과</td>
    							<td>${deptName }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">직급</td>
    							<td>${dto.position }</td>
    							<td>&nbsp;</td>
    						</tr>
    						<tr>
    							<td class="req">Email</td>
    							<td>
	    							<input type="text" id="uEmail_01"
    									maxlength="20" size="7" value="${email1 }">
    								<span>@</span>
    								<input type="text" id="uEmail_02"
    									maxlength="40" size="10" value=
    								<c:if test="${!empty email3}">
    									${ email3}
    								</c:if>
    								<c:if test="${ empty email3}">
    									${email2 }
    								</c:if>
    								>
    									
    								<select id="emailDomain" class="frmDropMenu">
    									<option
    									<c:if test="${!empty email3}">
    									selected="selected" value="${email3 }"
		    							</c:if>
    									>직접입력</option>
    									<option value="naver.com"
 			   							<c:if test="${email2 eq 'naver.com'}">
    									selected="selected"
		    							</c:if>
    									>naver.com</option>
    									<option value="daum.net"
    									<c:if test="${email2 eq 'daum.net'}">
    									selected="selected"
		    							</c:if>
    									>daum.net</option>
    								</select>
    								
    								<input type="hidden" name="uEmail" id="uEmail">
    								
    							</td>
    							<td>&nbsp;</td>
    						</tr>
    							<td colspan="3">
    								<button type="button" id="joinSbmBtn" class="frmBtn">회원정보수정</button>
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