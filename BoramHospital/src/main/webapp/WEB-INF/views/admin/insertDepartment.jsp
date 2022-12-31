<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>진료과 등록</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		//중복체크
	   	$("#regFrm button#idChkBtn").click(function(){
	   		
	   		let deptno = $("#deptno").val().trim();
	   		$("#deptno").val(deptno);
	   		
	   		// 정규표현식
	   		let regExp = /[^0-9]/g;
	   		let rExpRes = regExp.test(deptno);
	   		
	   		if (deptno == "") {    // 전체 공백 체크
	   			alert("진료과 번호를 입력해주세요");
	   			$("#deptno").focus();
	   		} else if (rExpRes) {    // 정규표현식 체크
	   			alert("숫자만 가능합니다.");
	   			$("#deptno").focus();
	   		} else {			
	   			let url = "/admin/deptnoCheck?deptno=" + deptno;
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
		
	   	$("#joinSbmBtn").click(function(){		
	   		fnJoinSbm();		
	   	});
   	
		function fnJoinSbm() {
	   		let deptno = $("#deptno").val().trim();
	   		$("#deptno").val(deptno);
	   		
	   		let deptName = $("#deptName").val().trim();
	   		$("#deptName").val(deptName);
	   		
	   		let idCheckResult = $("#idCheckResult").val().trim();
	   		$("#idCheckResult").val(idCheckResult);
	   		
	   		if (deptName == "") {
	   			alert("진료과를 입력해주세요.");
	   			$("#deptName").focus();
	   			return;
	   		} else if (deptno == "") {
	   			alert("진료과 번호를 입력해주세요.");
	   			$("#deptno").focus();
	   			return;
	   		} else if (idCheckResult != "true") {
	   			alert("진료과 번호 중복확인을 해주세요.");
	   			$("#deptno").focus();
	   			return;
	   		} else {
	   			let chkSbmTF = confirm("진료과를 등록하시겠습니까?");
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

				<form name="regFrm" id="regFrm" action="/admin/insertDeptProc" method="post">

					<table id="regFrmTbl">
						<caption>진료과 추가</caption>
							<input type="hidden" id="idCheckResult" name="idCheckResult">
						<tbody>
							<tr>
								<td class="req">진료과 이름</td>
								<td><input type="text" name="deptName" id="deptName" maxlength="20"
									autofocus>
								</td>
								<td><span></span></td>
							</tr>
							<tr>
								<td class="req">진료과번호</td>
								<td><input type="text" name="deptno" id="deptno" maxlength="2">&nbsp;
								<button type="button" id="idChkBtn" class="frmBtn">진료과번호 중복확인</button></td>
								<td><span>
								<c:if test="${empty list }">
									등록된 진료과가 없습니다.
								</c:if>
								<c:if test="${!empty list }">
									[등록된 진료과 번호 : 진료과] <br>
									 <c:forEach var="dept" items="${list }">
									 	${dept.deptno } : ${dept.deptName } <br>
									 </c:forEach>
								</c:if>
								</span></td>
							</tr>
							<tr>
								<td colspan="3">
									<button type="button" id="joinSbmBtn" class="frmBtn">진료과 등록</button>
									<button type="button" class="frmBtn" onclick="history.back()">이전페이지</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</main>


		<!--  푸터템플릿 시작 -->
		<%@ include file="../ind/footerTmp.jsp"%>
		<!--  푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->

</body>

</html>