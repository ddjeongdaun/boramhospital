<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>의료진 계정 생성</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
   	
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
   	
   	// 아이디 중복체크 팝업 
   	$("#regFrm button#idChkBtn").click(function(){
   		
   		let uId = $("#uId").val().trim();    // <input id="uId">의 값 반환
   		//alert("uId.length : " + uId.length);
   		$("#uId").val(uId);
   		
   		// 정규표현식 시작
   		let regExp = /[^a-z|A-Z|0-9]/g;
   		let rExpRes = regExp.test(uId);   // 정규표현식에 부합하면 true
   														   // 정규표현식에 부합하면지 않으면 false
   		//alert("rExpRes : " + rExpRes);	
   		// 정규표현식 끝		
   		if (uId == "") {    // 전체 공백 체크
   			alert("아이디를 입력해주세요");
   			$("#uId").focus();
   		} else if (uId.length < 3) {    // 글자수 체크
   			alert("아이디는 최소 3글자 이상입니다.");
   			$("#uId").focus();
   		} else if (rExpRes) {    // 정규표현식 체크
   			alert("영어대/소문자, 숫자 조합만 가능합니다.");
   			$("#uId").focus();
   		} else {			
   			let url = "/admin/idCheck?uId=" + uId;
   			let nickName = "idChkPop";
   	
   			let w = screen.width;     // 1920
   			let popWidth = 480;
   			let leftPos = (w - popWidth) / 2; // left Position 팝업창 왼쪽 시작위치
   	
   			let h = screen.height;    // 1080
   			let popHeight = 320;
   			let topPos = (h - popHeight) / 2; 		
   			let prop = "width="+ popWidth +", height="+ popHeight;
   				  prop += ", left=" + leftPos + ", top=" + topPos; 
   			window.open(url, nickName, prop);
   		}
   	});
   	/* 회원가입 버튼 전송 실행 */	
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
   		
   		let uId = $("#uId").val().trim();
   		$("#uId").val(uId);
   		
   		let uName = $("#uName").val().trim();
   		$("#uName").val(uName);
   		
   		let position = $("#position").val().trim();
   		$("#position").val(position);
   		
   		let deptno = $("#deptno").val().trim();
   		$("#deptno").val(deptno);
   		
   		let uEmail_01 = $("#uEmail_01").val().trim();
   		let uEmail_02 = $("#uEmail_02").val().trim();
   		$("#uEmail").val(uEmail_01+"@"+uEmail_02);
   		
   		let idCheckResult = $("#idCheckResult").val().trim();
   		
   		if (uId == "") {
   			alert("아이디를 입력해주세요.");
   			$("#uId").focus();
   			return;
   		} else if (idCheckResult != "true") {
   			alert("아이디 중복확인을 해주세요.");
   			$("#uId").focus();
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
   		} else if (position == "") {
   			alert("직급를 입력해주세요.");
   			$("#position").focus();
   			return;
   		} else if (deptno == "") {
   			alert("진료과 번호를 입력해주세요.");
   			$("#deptno").focus();
   			return;
   		} else {
   			let chkSbmTF = confirm("의료진 회원을 등록하시겠습니까?");
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
		<%@ include file="../ind/headerTmp.jsp"%>
		<!--  헤더템플릿 끝 -->


		<main id="main" class="dFlex">

			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="joinInsert">

				<form name="regFrm" id="regFrm" action="/admin/insertDoctorProc" method="post">

					<table id="regFrmTbl">
						<caption>의료진 계정 생성</caption>
						<input type="hidden" id="idCheckResult" name="idCheckResult">
						<tbody>
							<tr>
								<td class="req">아이디</td>
								<td><input type="text" name="uId" id="uId" maxlength="20"
									autofocus>
									<button type="button" id="idChkBtn" class="frmBtn">ID중복확인</button>
								</td>
								<td><span>영어대소문자, 숫자조합(3~20)</span></td>
							</tr>
							<tr>
								<td class="req">패스워드</td>
								<td><span style="font-size: 90%; color: gray;">초기비밀번호는 1234 으로 설정됩니다.</span></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="req">이름</td>
								<td><input type="text" name="uName" id="uName"
									maxlength="20"></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="req">Email</td>
								<td>
								<input type="text" id="uEmail_01" name="uEmail_01" maxlength="20" size="7"> 
								<span>@</span> 
								<input type="text" name="uEmail_02" id="uEmail_02" maxlength="40" size="10"> 
									<select id="emailDomain" class="frmDropMenu">
											<option value="">직접입력</option>
											<option>naver.com</option>
											<option>daum.net</option>
									</select>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td class="req">직급</td>
								<td><input type="text" name="position" id="position" maxlength="20"></td>
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
								<td colspan="3">
									<button type="button" id="joinSbmBtn" class="frmBtn">계정 생성</button>
									<button type="button" class="frmBtn" onclick="location.href='/admin/manageDoctor'">의료진 목록</button>
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
		<%@ include file="../ind/footerTmp.jsp"%>
		<!--  푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->

</body>

</html>