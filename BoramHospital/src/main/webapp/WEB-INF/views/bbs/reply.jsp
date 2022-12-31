<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%
request.setCharacterEncoding("UTF-8");
int num = Integer.parseInt(request.getParameter("num"));
//검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
//검색어 수신 끝

String nowPage = request.getParameter("nowPage");
%>    
 --%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>답변글 작성페이지</title>
	<link rel="stylesheet" href="/style/style_Common.css">
	<link rel="stylesheet" href="/style/style_Template.css">
	<link rel="stylesheet" href="/style/style_BBS.css">
	<script src="/source/jquery-3.6.0.min.js"></script>
	<script src="/script/script_BBS.js"></script>
</head>

<body>
    <div id="wrap">
		<%@ include file="../ind/headerTmp.jsp" %>
    	<main id="main" class="dFlex">
    		<div id="lnb">
				<%@ include file="../ind/mainLnbTmp.jsp" %>
    		</div>
    		
	    	<!-- 실제 작업 영역 시작 -->
    		<div id="contents" class="reply">
    		
				<!--  답변페이지 내용 출력 시작 -->
				<form name="replyFrm" action="/bbs/replyProc"
						method="post" id="replyFrm">
			
					<h2>답변글 작성</h2>
						
					<table id="replyTbl">
					<input type="hidden" id="ref" name="oriRef" value="${OriginalBoard.ref }">
					<input type="hidden" id="pos" name="oriPos" value="${OriginalBoard.pos }">
					<input type="hidden" id="depth" name="oriDepth" value="${OriginalBoard.depth }">
					<input type="hidden" id="vo" value="${vo }">
						<tbody id="replyTblBody">
							<tr>
								<td class="req">작성자</td>
								<td>${vo.uName }
								[<span class="ori_Txt">원본 작성자 : <b>${OriginalBoard.uName }</b></span> ]
									
								</td>
							</tr>
							<tr>
								<td class="req">제목</td>
								<td>
									<input type="text" name="subject" value="" size="50" id="subject">
									(<span class="ori_Txt">원본 제목 : <b>${OriginalBoard.subject }</b></span> )
								</td>
							</tr>
							<tr>
								<td style="vertical-align: top;">내용</td>
								<td>
									<textarea name="content" id="content" cols="89" wrap="hard"></textarea>
									
									<span id="ori_SpanTxtArea" class="ori_Txt">원본 글내용</span>
									<textarea id="ori_TxtArea"  
									cols="89" readonly>${OriginalBoard.content }</textarea>
									
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
								<td colspan="2" id="btnAreaTd" class="reply">
									<button type="submit" id="replyBtn">답변등록</button>
									<button type="reset">다시쓰기</button>
									<button type="button" id="backBtn">뒤 로</button>							
									</a>
								</td>
							</tr>
						</tfoot>
						 
					</table>
					<%-- <input type="hidden" name="num" value="<%=num%>" id="num">				
					<input type="hidden" name="uId" value="<%=uId%>">	
					<input type="hidden" name="uName" value="<%=replyName%>">
					<input type="hidden" name="ref" value="<%=ref%>">				
					<input type="hidden" name="depth" value="<%=depth%>">				
					<input type="hidden" name="pos" value="<%=pos%>"> --%>
					
					<%-- <input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage">
					<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
					
					<!-- 검색어전송 시작 -->
					<input type="hidden" name="keyField" id="keyField" value="<%=keyField%>">
					<input type="hidden" name="keyWord" id="keyWord" value="<%=keyWord%>">
					<!-- 검색어전송 끝 --> --%>
			
				</form>
				<!--  답변페이지 내용 출력 끝 -->
    		</div>
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
		<%@ include file="../ind/footerTmp.jsp" %>
    </div>
    <!-- div#wrap -->

</body>

</html>