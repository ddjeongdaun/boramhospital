/**
 * 
 */
$(function(){
	
	/* 답변입력양식 페이지에서 답변내용 전송*/
	$("td.reply>button#replyBtn").click(function(){
		
		let subject = $("#subject").val().trim();
		
		if (subject == "") {
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else {		
			$("#replyFrm").submit();
		}
	});
});