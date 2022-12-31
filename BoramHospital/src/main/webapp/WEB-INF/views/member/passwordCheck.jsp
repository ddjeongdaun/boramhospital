<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div id="wrap">
		<%@ include file="../ind/headerTmp.jsp" %>
    	
    	<main id="main" class="dFlex">
    	
    		<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp" %>
    		</div>
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="loginDiv">

				<form id="loginFrm" name="loginFrm" action="/member/memberMod" method="post">
	        
		        	<div id="loginArea">
		        		<div id="loginInput">
		        			<input type="password" name="uPw" placeholder="비밀번호 입력" id="uPw">
		        		</div>
		        		
		        		<button type="submit" id="loginBtn">비밀번호 확인</button><br>
		        	</div>
	        	
	        	</form>
    		</div>
    		    	
    	</main>
		<%@ include file="../ind/footerTmp.jsp" %>
    </div>

</body>

</html>