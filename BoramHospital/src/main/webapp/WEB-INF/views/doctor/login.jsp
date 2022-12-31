<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
String uId_Session = (String)session.getAttribute("uId_Session"); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>의료진 로그인</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	
<script type="text/javascript">

$(function(){
	
	/* 로그인 버튼 전송 실행 */	
	$("#loginBtn").click(function(){		
		fnLoginSbm();		
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
		if (code == "13") fnLoginSbm();
    });
	
	
	function fnLoginSbm() {
		
		let uId = $("#uId").val().trim();
		$("#uId").val(uId);
		let uPw = $("#uPw").val().trim();		
		$("#uPw").val(uPw);
		
		
		if (uId == "") {
			alert("아이디를 입력해주세요.");
			$("#uId").focus();
			return;
		} else if (uPw == "") {
			alert("비밀번호를 입력해주세요.");
			$("#uPw").focus();
			return;
		} else {			
			$("#loginFrm").submit();
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
	    		<!--  메인 LNB 템플릿 시작 -->
				<%@ include file="../ind/mainLnbTmp.jsp" %>
	    		<!--  메인 LNB 템플릿 끝 -->    	
    		</div>
    		
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="loginDiv">

				<form id="loginFrm" name="loginFrm" action="/doctor/loginOk" method="post">
	        
		        	<div id="loginArea">	        	
		        		<div id="loginInput">
		        			<input type="text" name="uId" placeholder="아이디 입력" id="uId">
		        			<input type="password" name="uPw" placeholder="비밀번호 입력" id="uPw">
		        		</div>
		        		
		        		<button type="button" id="loginBtn">의료진 로그인</button><br>
		        	</div>
		        	<!-- div#loginArea -->
	        	
	        	</form>

    		</div>
    		<!-- 실제 작업 영역 끝 div.loginDiv -->
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<%@ include file="../ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->

</body>

</html>