// 현재 페이지의 URL에서 userId 파라미터 값을 가져오는 방법
function getUserIdFromURL() {
    const params = new URLSearchParams(window.location.search); // URL에서 쿼리 파라미터 읽기
    return params.get("userId");  // 'userId' 파라미터 값을 반환
}

function submitAcceptLoan() {
    const userId = getUserIdFromURL();  // URL에서 userId 추출
    const loanAmount = document.getElementById("loanAmount").value; // loanAmount 값 가져오기

    if (!userId || !loanAmount) {
        console.error("userId 또는 loanAmount가 잘못되었습니다!");
        return;
    }

    // POST 요청 보내기
    fetch('/spike.com/admin/acceptLoan', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: new URLSearchParams({
            'userId': userId,
            'loanAmount': loanAmount,
        })
    })
    .then(response => {
        if (response.ok) {
            window.location.href = '/spike.com/admin/loanManagement';  // 대출 관리 페이지로 리다이렉트
        } else {
            window.location.href = '/spike.com/admin/loanManagement?error=true';  // 오류 발생 시
        }
    })
    .catch(error => {
        console.error("대출 수락 중 오류 발생", error);
    });
}

// URL에서 userId 추출하는 함수 예시
function getUserIdFromURL() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('userId');
}

