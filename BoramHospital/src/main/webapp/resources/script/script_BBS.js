/**
 * 
 */
$(function(){
	
	/* 답변입력양식 페이지에서 답변내용 전송 시작 /bbs/reply.jsp */
	$("td.reply>button#replyBtn").click(function(){
		
		let subject = $("#subject").val().trim();
		
		if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {		
			$("#replyFrm").submit();
		}
		
	});
	/* 답변입력양식 페이지에서 답변내용 전송 끝 /bbs/reply.jsp */		
	
	
	
	/* 리스트페이지 검색 시작 /bbs/list.jsp */	
	$("button#searchBtn").click(function(){
		let keyWord = $("#keyWord").val();    // 검색어에서는 .trim()을 지양하는 추세
		                                                      // 단, 로그인, 회원가입, 회원정보 수정에서 사용하는
                                                          // ID 에는 입력값 전후의 공백을 제거한다. 
		//alert("keyWord : " + keyWord +"\nkeyWord 글자수 : " + keyWord.length);
		if (keyWord=="") {
			alert("검색어를 입력해주세요.");
			$("#keyWord").focus();			
		} else {
			searchFrm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			$("#searchFrm").submit();
		}
	});	
	/* 리스트페이지 검색 끝 /bbs/list.jsp */	
	
	
	/* 검색 결과를 유지한 리스트페이지 이동 시작 /bbs/read.jsp */
	$("#listBtn").click(function(){
		let param = $("#nowPage").val().trim();
		let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	     
		let url = "/bbs/list.jsp?nowPage=" + param;		    
		    url += "&keyField="+p3;
	     	url += "&keyWord="+p4;
		location.href=url;
	});
	/* 검색 결과를 유지한 리스트페이지 이동 끝 /bbs/read.jsp */
	
	
});
	
	
/* 상세내용 보기 페이지 이동 시작 /bbs/list.jsp => read.jsp */
function read(p1, p2) {
	// p1 : num (게시글의 고유번호, 고유값, 키값 : Key Value)
	// p2 : nowPage (현재페이지)
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let param = "read.jsp?num="+p1;
	     param += "&nowPage="+p2;
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href=param;
}		
/* 상세내용 보기 페이지 이동 끝 /bbs/list.jsp => read.jsp  */



/* 리스트페이지 페이징 시작 /bbs/list.jsp */
function movePage(p1) {    // 페이지 이동
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord

	let param = "/bbs/list.jsp?nowPage="+p1;	    
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ; 
	location.href= param;

}
/* 리스트페이지 페이징 끝 /bbs/list.jsp */


/* 리스트페이지 페이징 블럭이동 시작 /bbs/list.jsp */
function moveBlock(p1, p2, param3) {    
	                // 이전 블럭 또는 이후 블럭으로 이동  p1 => nowBlock-1  또는 nowBlock+1

	let moveBlock = parseInt(p1);    // 이전 블럭의 시작페이지로 이동에 사용하는 소
	let pagePerBlock = parseInt(p2);	
	//alert("p1(moveBlock) : " + p1 + "\np2(pagePerBlock) : " + p2);
	
    let p3 = $("#pKeyField").val().trim();  // p3 : keyField
    let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	
	if (param3 == 'pb') {
		 param = "/bbs/list.jsp?nowPage="+(moveBlock*pagePerBlock);
	                                                          // moveBlock : nowBlock - 1 
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ;
	} else if (param3 == 'nb' ) {		
		 param = "/bbs/list.jsp?nowPage="+(pagePerBlock*(moveBlock-1)+1);   
	                                                          // moveBlock : nowBlock + 1 
	     param += "&keyField="+p3;
	     param += "&keyWord="+p4 ;
	}

	location.href=param;
}
/* 리스트페이지 페이징 블럭이동 끝 /bbs/list.jsp */

