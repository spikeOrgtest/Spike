/**
 * bbs.js
 */

function write_check(){
	if($.trim($('#notice_id').val()) == ''){
		alert('글쓴이를 입력하세요!');
		$('#notice_id').val('').focus();
		return false;
	}
	
	if($.trim($('#title').val()).length == 0){
		alert('글제목을 입력하세요!');
		$('#title').val('').focus();
		return false;
	}
	
	//if($.trim($('#bbs_pwd').val()) == ''){
	//	alert('비밀번호를 입력하세요!');
	//	$('#bbs_pwd').val('').focus();
	//	return false;
	//}
	
	if($.trim($('#content').val()) == ''){
		alert('글내용을 입력하세요!');
		$('#content').val('').focus();
		return false;
	}
}