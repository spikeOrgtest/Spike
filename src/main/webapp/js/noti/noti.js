/**
 * bbs.js
 */

function write_check(){
	if($.trim($('#notice_name').val()) == ''){
		alert('글쓴이를 입력하세요!');
		$('#notice_name').val('').focus();
		return false;
	}
	
	if($.trim($('#notice_title').val()).length == 0){
		alert('글제목을 입력하세요!');
		$('#title').val('').focus();
		return false;
	}
	
	//if($.trim($('#bbs_pwd').val()) == ''){
	//	alert('비밀번호를 입력하세요!');
	//	$('#bbs_pwd').val('').focus();
	//	return false;
	//}
	
	if($.trim($('#notice_cont').val()) == ''){
		alert('글내용을 입력하세요!');
		$('#content').val('').focus();
		return false;
}
	function del_check(notice_no, page) {
				// 확인 팝업 표시
				var confirmAction = confirm("정말 삭제하시겠습니까?");
				if (confirmAction) {
					// 사용자가 확인을 누르면 삭제 요청 URL로 이동
					window.location.href = '/spike.com/noti_del_ok?notice_no=' + notice_no + '&page=' + page;
				} else {
					// 취소하면 아무 동작도 하지 않음
					return false;
				}
				
	}
}