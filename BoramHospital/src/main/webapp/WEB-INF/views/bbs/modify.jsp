<%@page import="com.proj.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시글 수정</title>
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
    		<div id="contents" class="mod">

				
				<!--  뷰페이지 내용 출력 시작 -->			
				
				<form name="modifyFrm" id="modifyFrm" method="post" action="/bbs/modifyFrm">
					<input type="hidden" name="num" value="${dto.num }">
					<h2>${dto.subject}</h2>
						
					<table id="modTbl">
						<tbody id="modTblBody">
							<tr>
								<td class="req">작성자</td>
								<td>${dto.uName }</td>
							</tr>
							<tr>
								<td class="req">제목</td>
								<td>
									<input type="text" name="subject" value="${dto.subject }"
										size="50" id="subject">
								</td>
							</tr>
							<tr>
								<td style="vertical-align: top;">내용</td>
								<td>
									<textarea name="content" id="txtArea"  cols="89" wrap="hard">${dto.content }</textarea>
								</td>
							</tr>			
						</tbody>
						 
						<tfoot>	
							<tr>
								<td colspan="2" id="footTopSpace"></td>							
							</tr>	
							<tr>
								<td colspan="2" id="hrTd"><hr></td>							
							</tr>
							<tr>
								<td colspan="2" id="btnAreaTd" class="update">
									<button type="button" id="modProcBtn">수정하기</button>
									<button type="reset">다시쓰기</button>
									<button type="button" id="backBtn">뒤 로</button>							
								</td>
							</tr>
						</tfoot>
						 
					</table>
					<input type="hidden" name="nowPage" value="현재페이지" id="nowPage">
					<input type="hidden" name="num" value="번호" id="num">
					
					<!-- 검색어전송 시작 -->
					<input type="hidden" name="keyField" id="keyField" value="키워드필드">
					<input type="hidden" name="keyWord" id="keyWord" value="키워드">
					<!-- 검색어전송 끝 -->
			
				</form>
				<!--  뷰페이지 내용 출력 끝 -->

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