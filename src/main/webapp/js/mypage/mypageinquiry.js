// 계좌 정보 업데이트 함수
function updateAccountInfo() {
	const selectedAccount = document.getElementById('accountSelect').value;
	if (selectedAccount) {
	    const account = accountData[selectedAccount];

	    // 잔액 업데이트 (쉼표 추가)
	    const formattedBalance = formatNumber(account.balance.toString());
		
	    document.getElementById('balanceAmount').innerText = `${formattedBalance} 원`;

	    // 일일 한도 업데이트
	    document.getElementById('daylimit').innerText = `${formatNumber(account.daylimit.toString())} 원`;
		
		document.getElementById('onelimit').innerText = `${formatNumber(account.onelimit.toString())} 원`;

		const accountNumber = selectedAccount.match(/[\d-]+/)[0];
		
		document.getElementById('selectedAccountNumber1').value = accountNumber;
		document.getElementById('selectedAccountNumber2').value = accountNumber;
		
	}
}

// 숫자에 쉼표를 자동으로 추가하는 함수
function formatNumber(number) {
	return number.replace(/\B(?=(\d{3})+(?!\d))/g, ',');  // 3자리마다 쉼표 추가
}

// 거래 내역을 화면에 업데이트하는 함수
function updateTransactionHistory(transactions) {
    const transactionHistory = document.getElementById('transactionHistory');
    transactionHistory.innerHTML = ""; // 기존 거래 내역을 비웁니다.

    transactions.forEach(transaction => {
        const transactionItem = document.createElement('li');
        transactionItem.classList.add('list-group-item', 'd-flex', 'justify-content-between', 'align-items-center');
        
        // 첫 번째: 입금/출금 여부
        let transactionDetails = `
            <span class="badge ${transaction.type === "입금" ? 'bg-success' : 'bg-danger'}">
                ${transaction.type === "입금" ? '입금' : '출금'}
            </span>
        `;

        // 두 번째: 거래 대상 (출금/입금)
        if (transaction.type === "출금") {
            // 출금일 경우
            let destination = "";
            switch (transaction.destination) {
                case "증권":
                    destination = "증권사 계좌";
                    break;
                case "편의점":
                    destination = "편의점 결제";
                    break;
                case "인터넷":
                    destination = "인터넷 결제";
                    break;
                default:
                    destination = "기타";
            }
            transactionDetails += `
                <span class="transaction-content">
                    출금된 곳: ${destination} - ₩${transaction.amount.toLocaleString()}
                </span>
            `;
        } else if (transaction.type === "입금") {
            // 입금일 경우
            let source = "";
            switch (transaction.source) {
                case "급여":
                    source = "급여 계좌";
                    break;
                case "이체":
                    source = "타 계좌 이체";
                    break;
                case "가상화폐":
                    source = "가상화폐 거래소";
                    break;
                default:
                    source = "기타";
            }
            transactionDetails += `
                <span class="transaction-content">
                    입금된 곳: ${source} - ₩${transaction.amount.toLocaleString()}
                </span>
            `;
        }

        // 세 번째: 거래 날짜
        transactionDetails += `
            <span class="transaction-date">
                ${transaction.date}
            </span>
        `;
        
        transactionItem.innerHTML = transactionDetails;
        transactionHistory.appendChild(transactionItem);
    });
}

window.addEventListener('DOMContentLoaded', function() {
    const transactionHistoryContainer = document.getElementById('transactionHistoryContainer');
    transactionHistoryContainer.style.display = 'none';  // 페이지 로드 시 거래 내역을 숨깁니다.
});

// "검색" 버튼 클릭 시 필터링 함수 호출
document.getElementById('filterBtn').addEventListener('click', function() {
    filterTransactionHistory();
});

function filterTransactionHistory() {
    const selectedAccount = document.getElementById('accountSelect').value;
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    const transactionHistoryContainer = document.getElementById('transactionHistoryContainer');
    const noTransactionsMessage = document.getElementById('noTransactionsMessage');

    // 거래 내역을 미리 비웁니다.
    const transactionHistory = document.getElementById('transactionHistory');
    transactionHistory.innerHTML = ""; // 기존 거래 내역을 비웁니다.

    // 먼저 계좌가 선택되었는지 확인
    if (!selectedAccount) {
        alert("계좌를 선택해주세요.");
        return;
    }

    // 시작일과 종료일이 모두 선택된 경우에만 필터링
    if (!startDate || !endDate) {
        alert("시작일과 종료일을 모두 선택해주세요.");
        return;
    }

    // 계좌 데이터를 가져옵니다.
    const account = accountData[selectedAccount];
    let filteredTransactions = account.transactions;

    // 시작일과 종료일로 필터링
    filteredTransactions = filteredTransactions.filter(transaction => {
        const transactionDate = new Date(transaction.date);
        const start = new Date(startDate);
        const end = new Date(endDate);
        return transactionDate >= start && transactionDate <= end;
    });

    if (filteredTransactions.length > 0) {
        // 거래 내역을 업데이트합니다.
        updateTransactionHistory(filteredTransactions);
        transactionHistoryContainer.style.display = 'block'; // 거래 내역을 출력합니다.
        noTransactionsMessage.style.display = 'none'; // "검색된 거래 내역 없음" 메시지를 숨깁니다.
    } else {
        // 거래 내역이 없으면 메시지를 표시합니다.
        transactionHistoryContainer.style.display = 'none'; // 거래 내역을 숨깁니다.
        noTransactionsMessage.style.display = 'block'; // "검색된 거래 내역 없음" 메시지를 표시합니다.
    }
}


document.getElementById('startDate').addEventListener('change', function() {
    const transactionHistoryContainer = document.getElementById('transactionHistoryContainer');
    transactionHistoryContainer.style.display = 'none'; // 시작일 선택 시 거래 내역을 숨깁니다.
});

document.getElementById('endDate').addEventListener('change', function() {
    const transactionHistoryContainer = document.getElementById('transactionHistoryContainer');
    transactionHistoryContainer.style.display = 'none'; // 종료일 선택 시 거래 내역을 숨깁니다.
});

// 일일 출금 한도 설정 버튼 클릭 시 모달 띄우기
document.getElementById('setLimitBtn').addEventListener('click', function() {
    // Bootstrap 모달을 띄웁니다.
    var dailyLimitModal = new bootstrap.Modal(document.getElementById('dailyLimitModal'));
    dailyLimitModal.show();
});

function limitChange(event) {
	event.preventDefault();
	
	var dayLimit = document.getElementById('dayLimitInput').value;
	var oneLimit = document.getElementById('oneLimitInput').value;
	
	var form = document.getElementById('limit');
	form.querySelector('[name="day_limit"]').value = dayLimit;
	form.querySelector('[name="one_limit"]').value = oneLimit;
	
	form.submit();
	
};

document.getElementById('saveLimitBtn').addEventListener('click', function(event) {
	limitChange(event);
});

document.getElementById('changePasswordBtn').addEventListener('click', function(event) {
	changePassword(event);
});

function changePassword(event) {
	event.preventDefault();
	
    const currentPassword = document.getElementById("currentPassword").value;
    const newPassword = document.getElementById("newPassword").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    // 현재 비밀번호, 새 비밀번호, 확인 비밀번호 입력 확인
    if (!currentPassword || !newPassword || !confirmPassword) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    // 새 비밀번호와 확인 비밀번호가 일치하는지 확인
    if (newPassword !== confirmPassword) {
        alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        return;
    }

    // 비밀번호 길이 검증 (예: 최소 6자리 이상)
    if (newPassword.length < 6) {
        alert("새 비밀번호는 최소 6자 이상이어야 합니다.");
        return;
    }

	document.getElementById('confirmPassword').value = '';
	
	document.getElementById('passwordChangeForm').submit();
	
    // 모달 닫기 (Bootstrap 5에서 JavaScript로 모달을 닫는 방법)
    const modalElement = document.getElementById('passwordChangeModal');  // 모달 요소 참조
    const modal = bootstrap.Modal.getInstance(modalElement);  // 이미 열린 모달의 인스턴스를 가져옵니다.
    modal.hide();  // 모달을 닫습니다.
};

var modalElement = document.getElementById('dailyLimitModal');
var modal = new bootstrap.Modal(modalElement, {
    backdrop: 'static',  // 배경 클릭으로 모달을 닫지 않게 설정
    keyboard: false      // ESC로 모달 닫히지 않도록 설정
});

document.querySelector('[data-bs-dismiss="modal"]').addEventListener('click', function () {
    modal.hide();
    modal.dispose();  // 모달을 완전히 종료하고 리소스를 해제
    resetModalState();  // 모달이 닫히면 화면 원상복구
});

// 모달이 닫힐 때
modalElement.addEventListener('hidden.bs.modal', function () {
    resetModalState();  // 모달이 닫힐 때 배경 복원
});

function resetModalState() {
    // 화면 스크롤 복원
    document.body.style.overflow = 'auto';

    // backdrop 제거
    const backdrop = document.querySelector('.modal-backdrop');
    if (backdrop) {
        backdrop.remove();  // 배경 요소 삭제
    }
}
