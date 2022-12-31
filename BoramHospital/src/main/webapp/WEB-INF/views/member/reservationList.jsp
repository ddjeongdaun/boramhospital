<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>진료예약내역</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<style type="text/css">
table#memberList {
	width: 780px;
	margin: 20px;
	font-family: 120%;
}

td {
	text-align: center;
	padding: 5px;
}

</style>
</head>
<body>
	<div id="wrap">
		<%@ include file="../ind/headerTmp.jsp"%>
		<main id="main" class="dFlex">
			<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp"%>
			</div>

			<div id="contents">
				<h2>[진료 예약 내역]</h2>
				<br>
				<h5>&nbsp; * 진료 예약 내역을 삭제하려면 x 버튼 클릭하세요.</h5>
				<br>
				<hr>
				<table id="memberList">
					<tr id="memList2">
						<th id="t1">예약번호</th>
						<th id="t2">예약환자</th>
						<th id="t3">담당의사</th>
						<th id="t4">진료예약내역</th>
						<th id="t4">예약일자</th>
						<th id="t4">예약취소</th>
					</tr>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6"><br>예약내역이 존재하지 않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty list }">
						<c:forEach var="re" items="${list }">
							<tr id="memList3">
								<td id="t1">${re.no }</td>
								<td id="t2">${vo.uName }</td>
								<td id="t3">${re.uName }</td>
								<td id="t4">${re.reservation }</td>
								<td id="t4"><fmt:formatDate value="${re.regdate }"
										pattern="yyyy-MM-dd" /></td>
								<td id="t4"><input type="button" value="X" onclick="location.href='/member/deleteReservation?no=${re.no}'"></td>
							</tr>
						</c:forEach>
					</c:if>
						
				</table>
			</div>

		</main>
		<%@ include file="../ind/footerTmp.jsp"%>
	</div>
</body>
</html>