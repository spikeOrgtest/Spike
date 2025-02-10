// 현재 페이지의 URL에서 userId 파라미터 값을 가져오는 방법
function getUserIdFromURL() {
    const params = new URLSearchParams(window.location.search); // URL에서 쿼리 파라미터 읽기
    return params.get("userId");  // 'userId' 파라미터 값을 반환
}

function submitAcceptLoan() {
    const form = document.getElementById('loanForm');
    if (!form) {
        alert('폼을 찾을 수 없습니다.');
        return;
    }

    // 필수 값들이 있는지 확인
    const userId = form.querySelector('[name="userId"]').value;
    const loanAmount = form.querySelector('[name="loanAmount"]').value;

    if (!userId || !loanAmount) {
        alert('필수 정보가 누락되었습니다.');
        return;
    }

    // 사용자 확인
    if (confirm('대출을 승인하시겠습니까?')) {
        try {
            form.submit();
        } catch (error) {
            console.error('폼 제출 중 오류 발생:', error);
            alert('처리 중 오류가 발생했습니다.');
        }
    }
}

