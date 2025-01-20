/**
 * 
 */

function confirmDelete(notice_no, page) {
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