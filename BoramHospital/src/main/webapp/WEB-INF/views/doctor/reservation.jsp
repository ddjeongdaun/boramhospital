<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>진료내역</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<style type="text/css">
th#t4 {
    width: 300px;
}

table#memberList {
    width: 780px;
    margin: 20px;
    font-family: 120%;
}

td{
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
				<h2>[진료 내역]</h2><br>
				<h5>&nbsp; * 진료여부를 변경하려면 해당 진료내역의 진료여부를 클릭하세요.</h5>
				<h5>&nbsp; * 환자 상세정보는 성함을 클릭하세요.</h5>
				<br>
				<hr>
				<table id="memberList">
					<tr id="memList2">
						<th id="t1">진료번호</th>
						<th id="t2">성함</th>
						<th id="t4">예약내역</th>
						<th id="t3">예약일자</th>
						<th id="t1">진료여부</th>
					</tr>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5"> 진료내역이 존재하지 않습니다. </td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="rList" items="${list }">
								<tr id = "memList3">
									<td id="t1">${rList.no }</td>
									<td id="t2"><a href="/doctor/memberDetail?memId=${rList.memId }">${rList.uName }</a></td>
									<td id="t3">${rList.reservation }</td>
									<td id="t4">
									<fmt:formatDate value="${rList.regdate }" pattern="yyyy-MM-dd"/>
									</td>
									<td id="t1">
									<a href="/doctor/docCheckUpdate?no=${rList.no }&docCheck=${rList.docCheck}">
										<c:if test="${rList.docCheck == '0' }">X</c:if>
										<c:if test="${rList.docCheck == '1' }">O</c:if>
									</a>
									</td>
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