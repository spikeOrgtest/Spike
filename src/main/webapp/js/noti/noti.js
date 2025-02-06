/**
 * bbs.js
 */

function write_check(){
	if($.trim($('#noticeName').val()) == ''){
		alert('글쓴이를 입력하세요!');
		$('#noticeName').val('').focus();
		return false;
	}
	
	if($.trim($('#noticeTitle').val()).length == 0){
		alert('글제목을 입력하세요!');
		$('#noticeTitle').val('').focus();
		return false;
	}
	
	//if($.trim($('#bbs_pwd').val()) == ''){
	//	alert('비밀번호를 입력하세요!');
	//	$('#bbs_pwd').val('').focus();
	//	return false;
	//}
	
	if($.trim($('#noticeCont').val()) == ''){
		alert('글내용을 입력하세요!');
		$('#noticeCont').val('').focus();
		return false;
}

}

function confirmDelete(noticeNo, page) {
    // 확인 팝업 표시
    var confirmAction = confirm("정말 삭제하시겠습니까?");
    if (confirmAction) {
        // 사용자가 확인을 누르면 삭제 요청 URL로 이동
		alert('삭제가 완료되었습니다.');
        window.location.href = '/spike.com/noti_del_ok?noticeNo=' + noticeNo + '&page=' + page;
    } else {
        // 취소하면 아무 동작도 하지 않음
        return false;
    }
}

function write_Change(){
		
		if($.trim($('#noticeTitle').val()).length == 0){
			alert('변경하실 제목을 입력하세요!');
			$('#noticeTitle').val('').focus();
			return false;
		}
		
		if($.trim($('#noticeCont').val()).length == 0){
			alert('변경하실 내용을 입력하세요.')
			$('#noticeCont').val('').focus();
			return false;
		}
	
		var confirmAction1 = confirm("정말 변경하시겠습니까?");
		    if (confirmAction1) {
		        // 사용자가 확인을 누르면 삭제 요청 URL로 이동
				alert('변경 완료되었습니다.');
				window.location.href = '/spike.com/noti_cont?notice_no=' + noticeNo + '&page=' + page;
				} else {
			        // 사용자가 '취소'를 클릭했을 때
			        alert('변경이 취소되었습니다.');
					return false;
			    }
		
		
}

