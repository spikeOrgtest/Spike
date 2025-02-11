/**
 * bbs.js
 */

function write_check(){
	if($.trim($('#noticeName').val()) == ''){
		alert('작성자를 입력하세요!');
		$('#noticeName').val('').focus();
		return false;
	}
	
	if($.trim($('#noticeTitle').val()).length == 0){
		alert('제목을 입력하세요!');
		$('#noticeTitle').val('').focus();
		return false;
	}
	
	if($.trim($('#noticeCont').val()) == ''){
		alert('내용을 입력하세요!');
		$('#noticeCont').val('').focus();
		return false;
    }
	
	// 글쓰기 확인 여부
	    var result = confirm("글쓰기를 완료하시겠습니까?");
	    if(result) {
	        alert("글쓰기가 완료되었습니다.");
	        return true;  // 글쓰기 완료 후 폼 제출
	    } else {
	        alert("글쓰기가 취소되었습니다.");
			window.location.href = '/spike.com/notice';
	        return false;
	        
	    }

}

function confirmDelete(noticeNo, page) {
    // 확인 팝업 표시
    var confirmAction = confirm("정말 삭제하시겠습니까?");
    if (confirmAction) {
        // 사용자가 확인을 누르면 삭제 요청 URL로 이동
		alert('삭제가 완료되었습니다.');
        window.location.href = '/spike.com/admin/noti_del_ok?noticeNo=' + noticeNo + '&page=' + page;
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

