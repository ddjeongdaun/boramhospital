<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글내용 보기</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<link rel="stylesheet" href="/style/style_BBS.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script_BBS.js"></script>
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
    		<div id="contents" class="bbsRead">

				<!--  게시글 상세보기 페이지 내용 출력 시작 -->
				<h2>${dto.subject }</h2>
				
				<table id="readTbl">
					<tbody id="readTblBody">
						<tr>
							<td>작성자</td>  <!-- td.req 필수입력 -->
							<td>${dto.uName }</td>
							<td>등록일</td>  <!-- td.req 필수입력 -->
							<td>${dto.regTM }</td>
						</tr>
						<tr>
							<!-- 첨부파일 처리 -->
							<td>첨부파일</td> <!-- td.req 필수입력 -->
							<td colspan="3">
								<c:if test="${empty dto.fileName }">
									등록된 파일이 없습니다.
								</c:if>
								
								<c:if test="${!empty dto.fileName }">
									<a href="/resources/download?fileName=${dto.fileName }">${dto.fileName}</a>
								</c:if>
								<input type="hidden" name="fileName" value="${dto.fileName }" id="hiddenFname">
							</td>
						</tr>
						<tr>
							<td colspan="4" id="readContentTd"><pre>${dto.content}</pre></td>
						</tr>
					</tbody>
					 
					<tfoot id="readTblFoot">	
						<tr>
							<td colspan="4" id="footTopSpace"></td>							
						</tr>			     
						<tr>
							<td colspan="4" id="articleInfoTd">
								<span>조회수 : ${dto.readCnt }</span>
							</td>							
						</tr>
						<tr>
							<td colspan="4" id="hrTd"><hr></td>							
						</tr>
						<tr>
							<td colspan="4" id="btnAreaTd" class="read">
								<a href="/bbs/list?page=${page }&keyWord=${keyWord }&keyField=${keyField}"><button type="submit" id="listBtn">목 록</button></a>
								<a href="/bbs/reply?num=${dto.num }"><button type="button" id="replyBtn">답 변</button></a>
								
								<!-- 작성자 아이디 확인 후 수정,삭제 메뉴 표시 -->
								<c:if test="${uId_result }">
									<c:if test="${dto.checkDel }">
									</c:if>
									<c:if test="${dto.checkDel == false}">
									<a href="/bbs/update?num=${dto.num }"><button type="button" id="update">수 정</button></a>
									<a href="/bbs/delete?num=${dto.num }"><button type="button" id="delete">삭 제</button></a>
									</c:if>
								</c:if>
								<c:if test="${adminResult }">
									<c:if test="${dto.checkDel }">
									</c:if>
									<c:if test="${dto.checkDel == false}">
									<a href="/bbs/delete?num=${dto.num }"><button type="button" id="delete">삭 제</button></a>
									</c:if>
								</c:if>
							</td>
						</tr>
					</tfoot>
					 
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