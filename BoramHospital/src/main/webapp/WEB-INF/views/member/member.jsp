<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
   	
   	
   	// 아이디 중복체크 팝업 
   	$("#regFrm button#idChkBtn").click(function(){
   		
   		let uId = $("#uId").val().trim();    // <input id="uId">의 값 반환
   		//alert("uId.length : " + uId.length);
   		$("#uId").val(uId);
   		
   		// 정규표현식 시작
   		let regExp = /[^a-z|A-Z|0-9]/g;
   		let rExpRes = regExp.test(uId);   // 정규표현식에 부합하면 true
   										// 정규표현식에 부합하면지 않으면 false
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
   			let url = "/member/idCheck?uId=" + uId;
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
   	
   	// Email 유효성 검사 => 공백검사만!
   	$("#emailAuthBtn").click(function(){
   		
   		let uEmail_01 = $("#uEmail_01").val().trim();
   		let uEmail_02 = $("#uEmail_02").val().trim();
   		
   		if (uEmail_01 == "") {
   			alert("이메일 주소를 확인해주세요");
   			$("#uEmail_01").focus();			
   		} else if (uEmail_02 == "") {
   			alert("이메일 주소를 확인해주세요");
   			$("#uEmail_02").focus();
   		} else {
   			$("#emailAuthArea").css({"display": "block"});
   		}
   	});
   	
   	// 우편번호 찾기 팝업 
   	$("#regFrm button#findZipBtn").click(function(){
   		
   		let url = "/member/zipCheck";
   		let nickName = "zipChkPop";

   		let w = screen.width;     // 1920
   		let popWidth = 640;
   		let leftPos = (w - popWidth) / 2; // left Position 팝업창 왼쪽 시작위치

   		let h = screen.height;    // 1080
   		let popHeight = 400;
   		let topPos = (h - popHeight) / 2; 		
   		
   		let prop = "width="+ popWidth +", height="+ popHeight;
   			  prop += ", left=" + leftPos + ", top=" + topPos; 
   		window.open(url, nickName, prop);
   		
   	});
   	
   	
   	// 우편번호 팝업창에서 주소 검색
   	$("#addrSearchBtn").click(function(){
   		let area3 = $("#area3").val().trim();
   		if (area3 == "") {
   			alert("검색어를 입력해주세요.");
   			$("#area3").focus();
   		} else {
   			$("#zipFrm").submit();
   		}
   	});
   	
   	
   	// 우편번호 팝업창에서 주소 선택
   	$("table#zipResTbl td").click(function(){
   		let txtAddr = $(this).children("span").text();
   		let zipcode = txtAddr.substring(0, 7);
   		let addr = txtAddr.substring(8);
   		window.opener.uZipcode.value = zipcode;
   		window.opener.uAddr.value = addr;
   		window.close();
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
   		let uPw = $("#uPw").val().trim();		
   		$("#uPw").val(uPw);		
   		let uPw_Re = $("#uPw_Re").val().trim();	
   		let uName = $("#uName").val().trim();
   		$("#uName").val(uName);
   		
   		let uEmail_01 = $("#uEmail_01").val().trim();
   		let uEmail_02 = $("#uEmail_02").val().trim();
   		$("#uEmail").val(uEmail_01+"@"+uEmail_02);
   		
   		let uBirthday = $("#uBirthday").val().trim();
   		let idCheckResult = $("#idCheckResult").val().trim();
   		
   		if (uId == "") {
   			alert("아이디를 입력해주세요.");
   			$("#uId").focus();
   			return;
   		} else if (idCheckResult != "true") {
   			alert("아이디 중복확인을 해주세요.");
   			$("#uId").focus();
   			return;
   		} else if (uPw == "") {
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
   		} else if (uBirthday != "" && isNaN(uBirthday)) {
   			// 생년월일 숫자유효성 검사
   			alert("생년월일은 숫자만 입력할 수 있습니다.");
   			$("#uBirthday").val("").focus();
   			return;
   		} else {
   			let chkSbmTF = confirm("회원가입하시겠습니까?");
   			if (chkSbmTF) {
   				$("#regFrm").attr("action", "/member/memberProc");
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

				<form name="regFrm" id="regFrm">

					<table id="regFrmTbl">
						<caption>회원 가입</caption>
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
								<td><input type="password" name="uPw" id="uPw"
									maxlength="20"> <input type="checkbox" id="pwView">
									비밀번호 보기</td>
								<td><span>영어소문자/숫자, _, @, $, 5~20 </span> <!-- 공통비번1234 로 필 변경! -->
								</td>
							</tr>
							<tr>
								<td class="req">패스워드 확인</td>
								<td><input type="password" id="uPw_Re" maxlength="20">
									<span id="pwChk"></span></td>
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
								<td><input type="text" id="uEmail_01" maxlength="20"
									size="7"> 
									<span>@</span> 
									<input type="text" id="uEmail_02" maxlength="40" size="10">
									<select id="emailDomain" class="frmDropMenu">
										<option value="">직접입력</option>
										<option>naver.com</option>
										<option>daum.net</option>
								</select>
								<td>&nbsp;</td>
							<input type="hidden" name="uEmail" id="uEmail">
							</tr>
							<tr>
								<td>성별</td>
								<td><label> 남 <input type="radio" name="gender"
										value="1">
								</label> <label> 여 <input type="radio" name="gender" value="2">
								</label></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="uBirthday" id="uBirthday"
									maxlength="6" size="8">&nbsp;&nbsp;&nbsp;&nbsp; <span>ex.
										830815</span></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>우편번호</td>
								<td><input type="text" name="uZipcode" id="uZipcode"
									maxlength="7" size="7" readonly>
									<button type="button" id="findZipBtn" class="frmBtn">우편번호찾기</button>
								</td>
								<td><span>우편번호 찾기 버튼을 클릭하세요.</span></td>
							</tr>
							<tr>
								<td>주소</td>
								<td><input type="text" name="uAddr" id="uAddr"
									maxlength="100" size="50"></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>취미</td>
								<td>
								<label> 인터넷 <input type="checkbox" name="uHobby" value="인터넷">
								</label>
								<label> 여행 <input type="checkbox" name="uHobby" value="여행">
								</label> 
								<label> 게임 <input type="checkbox" name="uHobby" value="게임">
								</label> 
								<label> 영화 <input type="checkbox" name="uHobby" value="영화">
								</label> 
								<label> 운동 <input type="checkbox" name="uHobby" value="운동">
								</label></td>
								<td></td>
							</tr>
							<tr>
								<td>직업</td>
								<td><select name="uJob" id="uJob" class="frmDropMenu">
										<option value="">- 선택 -</option>
										<option>교수</option>
										<option>학생</option>
										<option>회사원</option>
										<option>공무원</option>
										<option>자영업</option>
										<option>전문직</option>
										<option>주부</option>
										<option>무직</option>
								</select></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3">
									<button type="button" id="joinSbmBtn" class="frmBtn">회원가입</button>
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
		<%@ include file="../ind/footerTmp.jsp"%>
		<!--  푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->

</body>

</html>