<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Untitled</title>
</head>
<body>
	<div id="wrap">
		<form action="/bbs/uploadFormAction" method="post" enctype="multipart/form-data">
		<input type="file" name="uploadFile" multiple>
		<input type="submit" value="저장">
		</form>
	</div>
</body>
</html>