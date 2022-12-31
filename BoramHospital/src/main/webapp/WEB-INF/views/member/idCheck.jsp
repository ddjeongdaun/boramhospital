<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 중복 체크</title>
    <link rel="stylesheet" href="/style/style_Common.css">    
    <script src="/source/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(function(){
	 // 아이디 중복체크 팝업창 닫기 / id체크 결과값 전달
		$("#btnCap").click(function(){
			var check = document.getElementById("check").value;
			window.opener.document.getElementById("idCheckResult").value = check;
			window.close();
			opener.regFrm.uId.focus();
		});
		
    });
    </script>
</head>

<body>
    <div id="wrap_Popup">
    	
    	<div>
    		<h1>${uId }</h1><br>
    		<span>${uId } ${msg }</span>
    	</div>
    	<hr>
    	<div id="closeBtnArea">
    		<button type="button" value="btnCap" id="btnCap">${btnCap}</button>
    		<input type="hidden" name="check" id="check" value="${check }">
    	</div>
    	
    </div>

</body>

</html>






