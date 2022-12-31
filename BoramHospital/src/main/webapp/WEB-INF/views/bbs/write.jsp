<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<link rel="stylesheet" href="/style/style_BBS.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=writeFrm]').submit(function(){
			if($('#subject').val()==""){
				alert('제목은 필수입력 항목입니다');
				return false;
			}else{
				$('form[name=writeFrm]').submit();
			}
		});
	});
</script>
</head>

<body>
	<div id="wrap">
		<%@ include file="../ind/headerTmp.jsp"%>
		<main id="main" class="dFlex">
			<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp"%>
			</div>

			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="bbsWrite">
				<h2>글쓰기</h2>
				<form action="/bbs/writeFrm" method="post" enctype="multipart/form-data" name="writeFrm" id="writeFrm">
		
					<input type="hidden" name="uId" id="uId" value="${vo.uId }">
					<input type="hidden" name="uName" id="uName" value="${vo.uName }">

					<table>
						<tbody>
							<tr>
								<td class="req">성명</td>
								<td><span>${vo.uName }</span></td>
							</tr>
							<tr>
								<td class="req">제목</td>
								<td><input type="text" name="subject" maxlength="50"
									id="subject" value=""></td>
							</tr>
							<tr>
								<td class="contentTD">내용</td>
								<td><textarea name="content" id="content" cols="60"
										wrap="hard"></textarea></td>
							</tr>
							<tr>
								<td>파일첨부</td>
								<td>
									<input type="file" name="uploadFile" multiple>
								</td>
							</tr>
							<tr>
								<td>내용타입</td>
								<td>
									<label>
										<input type="radio" name="contentType" value="HTML">
										<span>HTML</span>
									</label>
								
									<label>
										<input type="radio" name="contentType"value="TEXT" checked>
										<span>TEXT</span>
									</label>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="2"><hr></td>
							</tr>
							<tr>
								<td colspan="2">
									<button type="submit" id="regBtn">등록</button>
									<button type="reset">다시쓰기</button>
									<a href="/bbs/list"><button type="button" id="listBtn">리스트</button></a>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>

			</div>
			<!-- 실제 작업 영역 끝 -->
		</main>
		<%@ include file="../ind/footerTmp.jsp"%>
	</div>
</body>
</html>