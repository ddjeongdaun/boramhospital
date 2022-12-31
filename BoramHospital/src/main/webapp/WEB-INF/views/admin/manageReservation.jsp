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
<title>진료내역 관리</title>
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

li.PageNumbering {
	float: center;
	margin: 5px;
	display: inline-block;
}

li.prevBtn {
	float: center;
	margin: 5px;
	display: inline-block;
}

li.nextBtn {
	float: center;
	margin: 5px;
	display: inline-block;
}

.active {
	font-weight: bold;
}

#pageInfo {
	float: right;
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
				<h2>[진료 내역 관리 페이지]</h2>
				<br>
				<h5>&nbsp; * 계정별 진료관리 페이지로 이동하려면 예약내역을 클릭하세요.</h5>
				<br>
				<hr>
				<table id="memberList">
					<tr id="memList2">
						<th id="t1">번호</th>
						<th id="t2">예약환자</th>
						<th id="t3">담당의사</th>
						<th id="t4">진료예약내역</th>
						<th id="t4">예약일자</th>
						<th id="t4">진료여부</th>
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
								<td id="t2">${re.memId }</td>
								<td id="t3">${re.docId }</td>
								<td id="t4"><a href="/admin/reservationDetail?no=${re.no }">${re.reservation }</a></td>
								<td id="t4"><fmt:formatDate value="${re.regdate }"
										pattern="yyyy-MM-dd" /></td>
								<td id="t4">
								<c:if test="${re.docCheck}">
									완료
								</c:if>
								<c:if test="${!re.docCheck}">
									진료전
								</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					
					<!-- 페이징 -->
						<tr id="listPageArea">
							<td colspan="5" id="pagingTd">
							
							<ul class="btn-group pagination">
								<!-- 이전페이지 -->
								<c:if test="${pageMaker.prev }">
									<li class="prevBtn">
									<span class="moveBlockArea">
										<a href="<c:url value='/admin/manageReservation?page=${pageMaker.startPage-1 }'/>">이전</a>
									</span>
									</li>
								</c:if>
								
							<!-- 넘버링 -->
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
								<li class="PageNumbering ${pageMaker.cri.page == pageNum ? "active" : " " } ">
									<a href="<c:url value="/admin/manageReservation?page=${pageNum }"/>">${pageNum }</a>
								</li>
							</c:forEach>
								
							<!-- 다음페이지 -->
							<c:if test="${pageMaker.next && pageMaker.endPage >0}">
								<li class="nextBtn">
								<span class="moveBlockArea">
									<a href='<c:url value="/admin/manageReservation?page=${pageMaker.endPage+1 }"/>'>다음</a>
								</span>
								</li>
							</c:if>
							
							</ul>
						</tr>
						<!-- 페이징 끝 -->
						
				</table>
			</div>

		</main>
		<%@ include file="../ind/footerTmp.jsp"%>
	</div>
</body>
</html>