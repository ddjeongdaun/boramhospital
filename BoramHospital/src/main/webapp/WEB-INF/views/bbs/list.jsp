<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Q/A게시판</title>
	<link rel="stylesheet" href="<c:url value="/style/style_Common.css" />">
	<link rel="stylesheet" href="/style/style_Template.css">
	<link rel="stylesheet" href="/style/style_BBS.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script_BBS.js"></script>
	<style type="text/css">
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
	</style>
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
    		<div id="contents" class="bbsList">
	    		<div id="pageInfo" class="dFlex">
					<span>전체게시글 :  ${pageMaker.totalCount } 개</span>
					<span>페이지 :  ${pageMaker.cri.page} / ${pageMaker.endPage }</span>  
				</div>	
					
			<table id="boardList">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>이름</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>		
					<tr>
						<td colspan="5" class="spaceTd"></td>
					</tr>		
				</thead>
				<tbody>
				<!-- 게시물이 없을 때 -->
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">게시물이 없습니다.</td>
					</tr>				
				</c:if>
				
				<!-- 게시물이 있을 때 -->
				<c:if test="${!empty list }">
					<c:forEach var="boardList" items="${list }">
					<tr class="prnTr" onclick="">
						<td name="num" id="num">
						<c:if test="${boardList.pos eq 0 }">${boardList.num }</c:if>
						</td>
						
						<td class="subjectTd">
						<c:if test="${!empty boardList.uName }">
							<a href="/bbs/read?num=${boardList.num }&keyField=${keyField}&keyWord=${keyWord}&page=${page}">
						</c:if>
						
							<!-- 제목/답변글처리 -->
							<c:if test="${boardList.depth eq 1 }">
								<img src="/resources/images/replyImg.png">
							</c:if>
							<c:if test="${boardList.depth eq 2 }">
								&nbsp; <img src="/resources/images/replyImg.png">
							</c:if>
							<c:if test="${boardList.depth eq 3 }">
								&nbsp;&nbsp; <img src="/resources/images/replyImg.png">
							</c:if>
						${boardList.subject }</a></td>
						<td>${boardList.uName }</td>
						
						<td>
						<c:if test="${!empty boardList.uName }">
							${boardList.regTM }
						</c:if>
						</td>
						
						<td>
						<c:if test="${!empty boardList.uName }">
							${boardList.readCnt }
						</c:if>
						</td>
					</tr>
					
					</c:forEach>
				</c:if>
					
					<!-- 로그인 확인 -->
					<tr id="listBtnArea">
						<td colspan="2">
						<c:if test="${sessionResult = true }">
							<a href="/bbs/write">
							<button type="button" id="write" class="listBtnStyle">글쓰기</button>
							</a>
						</c:if>
						<c:if test="${sessionResult = false}">
							<button type="button" id="writeBtn" class="listBtnStyle">글쓰기</button>
						</c:if>
						</td>
						
						<td colspan="3">
						
					<!-- 검색 -->
					<form name="searchFrm" class="dFlex" id="searchFrm" action="/bbs/list">
						<div>
							<select name="keyField" id="keyField">
								<option value="subject" <c:if test="${keyField eq 'subject' }">selected</c:if>>제  목</option>
								<option value="uName" <c:if test="${keyField eq 'uName' }">selected</c:if>>이  름</option>
								<option value="content" <c:if test="${keyField eq 'content' }">selected</c:if>>내  용</option>
							</select>
						</div>
						<div>
							<input type="text" name="keyWord" id="keyWord" size="20" maxlength="30"
							<c:if test="${!empty keyWord}">value="${keyWord }"</c:if>>
						</div>
						<div>
							<input type="hidden" name="page" value="${pageMaker.cri.page }">
							<input type="hidden" name="perPageNum" value="${pageMaker.cri.perPageNum }">
							<button type="submit" id="searchBtn" class="listBtnStyle">검색</button>
						</div>
					</form>
						</td>
					</tr>  <!-- tr#listBtnArea -->
					
					<!-- 페이징 시작 -->
					<tr id="listPagingArea">
						<td colspan="5" id="pagingTd">

					<!-- 다음 블럭이 남아 있을때 처리 -->
					<ul class="btn-group pagination">
						<!-- 이전 페이지 -->
					    <c:if test="${pageMaker.prev }">
						    <li class="prevBtn">
						    <span class="moveBlockArea">
						        <a href='<c:url value="/bbs/list?page=${pageMaker.startPage-1 }${pageMaker.searchKeyfieldKeyword }"/>'>이전</a>
						    </span>
						    </li>
					    </c:if>
					    
					    <!-- 페이지 넘버링 -->
					    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
						    <li class="PageNumbering ${pageMaker.cri.page == pageNum ? "active" : " " } ">
						        <a href='<c:url value="/bbs/list?page=${pageNum }${pageMaker.searchKeyfieldKeyword }"/>'>${pageNum }</a>
						    </li>
						</c:forEach>
					    
				    	<!-- 다음 페이지 -->
					    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
						    <li class="nextBtn" >
						    <span class="moveBlockArea">
						        <a href='<c:url value="/bbs/list?page=${pageMaker.endPage+1 }${pageMaker.searchKeyfieldKeyword }"/>'>다음</a>
						    </span>
						    </li>
					    </c:if>
						</ul>	
						</td>
					</tr>
				</tbody>
			</table>
		
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    	<!--  main#main  -->       	   	
    	<!--  푸터템플릿 시작 -->
		<%@ include file="../ind/footerTmp.jsp" %>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->

</body>

</html>