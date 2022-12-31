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
<title>의료진 관리 페이지</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style_Template.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<style type="text/css">
table#memberList {
    width: 780px;
    margin: 20px;
    font-family: 120%;
}

td{
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
		 .active{
		      font-weight: bold;
		}
		
		#pageInfo{
			float: right;
		}
		 input.insertBtn {
		    font-size: 14px;
		    padding: 4px 14px 5px;
		    cursor: pointer;
		    transform: translateY(-1px);
		    float: right;
		    display: inline-block;
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
				<h2>[의료진 관리 페이지]</h2><br>
				<h5>&nbsp; * 계정별 회원관리 페이지로 이동하려면 회원 아이디를 클릭하세요.</h5><br>
				<hr>
				<table id="memberList">
					<tr id="memList2">
						<th id="t1">번호</th>
						<th id="t2">아이디</th>
						<th id="t3">이름</th>
						<th id="t4">이메일</th>
						<th id="t4">가입일자</th>
					</tr>
						<c:if test="${empty list }">
							<tr>
								<td colspan="5"> 가입된 회원이 존재하지 않습니다. </td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="mem" items="${list }">
							<tr id = "memList3">
								<td id="t1">${mem.num }</td>
								<td id="t2"><a href="/admin/doctorDetail?num=${mem.num }">${mem.uId }</a></td>
								<td id="t3">${mem.uName }</td>
								<td id="t4">${mem.uEmail }</td>
								<td id="t4"><fmt:formatDate value="${mem.joinTM }" pattern="yyyy-MM-dd"/></td>
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
										<a href="<c:url value='/admin/manageDoctor?page=${pageMaker.startPage-1 }'/>">이전</a>
									</span>
									</li>
								</c:if>
								
							<!-- 넘버링 -->
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
								<li class="PageNumbering ${pageMaker.cri.page == pageNum ? "active" : " " } ">
									<a href="<c:url value="/admin/manageDoctor?page=${pageNum }"/>">${pageNum }</a>
								</li>
							</c:forEach>
								
							<!-- 다음페이지 -->
							<c:if test="${pageMaker.next && pageMaker.endPage >0}">
								<li class="nextBtn">
								<span class="moveBlockArea">
									<a href='<c:url value="/admin/manageDoctor?page=${pageMaker.endPage+1 }"/>'>다음</a>
								</span>
								</li>
							</c:if>
							
							</ul>
						</tr>
						<!-- 페이징 끝 -->
						
						<tr>
    						<td colspan="5">
    							<input type="button" class="insertBtn" value="의료진 계정 생성" onclick="location.href='/admin/insertDoctor'">
    						</td>
    					</tr>
				</table>
			</div>
			
		</main>
		<%@ include file="../ind/footerTmp.jsp"%>
	</div>
</body>
</html>