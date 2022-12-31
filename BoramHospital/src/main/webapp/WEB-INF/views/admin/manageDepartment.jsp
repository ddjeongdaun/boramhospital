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
<title>진료과 관리 페이지</title>
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
				<h2>[진료과 관리 페이지]</h2><br>
				<h5>&nbsp; * 진료과를 삭제하려면 삭제버튼을 클릭하세요. 단, 사용중인 진료과는 삭제할 수 없습니다.</h5><br>
				<hr>
				<table id="memberList">
					<tr id="memList2">
						<th id="t1">번호</th>
						<th id="t2">진료과</th>
						<th id="t2">진료과 삭제</th>
					</tr>
						<c:if test="${empty list }">
							<tr>
								<td colspan="2"> 등록된 진료과가 존재하지 않습니다. </td>
							</tr>
						</c:if>
						<c:if test="${!empty list }">
							<c:forEach var="dept" items="${list }">
							<tr id = "memList3">
								<td id="t1">${dept.deptno}</td>
								<td id="t2">${dept.deptName }</td>
								<td id="t2"><input type="button" value="X" onclick="location.href='/admin/deleteDepartment?deptno=${dept.deptno}'"></td>
							</tr>
							</c:forEach>
						</c:if>
						
						<tr>
    						<td colspan="3">
    							<input type="button" class="insertBtn" value="진료과 등록" onclick="location.href='/admin/insertDepartment'">
    						</td>
    					</tr>
				</table>
			</div>
			
		</main>
		<%@ include file="../ind/footerTmp.jsp"%>
	</div>
</body>
</html>