// 계좌 정보 데이터
const accountData = {
    "123-4567-8901:일반": {
        balance: 2345678,
        available: 1234567,
        transactions: [
            { date: "2024-11-28", type: "출금", amount: 500000, destination: "증권" },
            { date: "2024-11-27", type: "입금", amount: 200000, source: "급여" },
            { date: "2024-11-26", type: "출금", amount: 300000, destination: "편의점" }
        ]
    },
    "987-6543-2100:mini": {
        balance: 3456789,
        available: 2345678,
        transactions: [
            { date: "2024-11-28", type: "입금", amount: 1000000, source: "이체" },
            { date: "2024-11-27", type: "출금", amount: 200000, destination: "인터넷" },
            { date: "2024-11-26", type: "입금", amount: 150000, source: "급여" }
        ]
    },
    "456-7890-1234:증권": {
        balance: 4567890,
        available: 3456789,
        transactions: [
            { date: "2024-11-28", type: "입금", amount: 500000, source: "가상화폐" },
            { date: "2024-11-27", type: "출금", amount: 400000, destination: "증권" },
            { date: "2024-11-26", type: "입금", amount: 300000, source: "이체" }
        ]
    }
};

// 계좌 정보 업데이트 함수
function updateAccountInfo() {
    const selectedAccount = document.getElementById('accountSelect').value;
    if (selectedAccount) {
        const account = accountData[selectedAccount];

        // 잔액 및 일일한도 업데이트
        document.getElementById('balanceAmount').innerText = `₩${account.balance.toLocaleString()}`;
        document.getElementById('availableAmount').innerText = `₩${account.available.toLocaleString()}`;

        // 거래 내역 업데이트
        updateTransactionHistory(account.transactions);
    }
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

// 숫자에 쉼표를 자동으로 추가하는 함수
function formatNumber(input) {
    let value = input.value;

    // 숫자만 남기고 쉼표를 추가하기 위한 정규식
    value = value.replace(/[^0-9]/g, '');  // 숫자 외의 문자 제거
    value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ',');  // 3자리마다 쉼표 추가

    // 입력된 값을 다시 input 필드에 설정
    input.value = value;
}

// 일일한도 설정 입력값에 ₩ 기호 자동 추가
document.getElementById('dailyLimitInput').addEventListener('input', function() {
    formatNumber(this);

    // 쉼표가 포함된 값을 ₩ 기호로 시작하게 변경
    const formattedValue = '₩' + this.value;
    this.value = formattedValue; // 입력 필드에 새로운 값 설정
});

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

// 모달 내 "저장" 버튼 클릭 시 처리
document.getElementById('saveLimitBtn').addEventListener('click', function() {
    const dailyLimit = document.getElementById('dailyLimitInput').value;
    if (dailyLimit) {
        // 출금 한도 설정 처리
        alert("설정된 출금 한도: " + dailyLimit + " 원");

        // 출금 한도 설정 후 모달 닫기
        var dailyLimitModal = bootstrap.Modal.getInstance(document.getElementById('dailyLimitModal'));
        dailyLimitModal.hide();

        // 설정된 출금 한도를 화면에 반영
        const selectedAccount = document.getElementById('accountSelect').value;
        if (selectedAccount) {
            const account = accountData[selectedAccount];
            account.available = parseInt(dailyLimit.replace(/[^0-9]/g, '')); // 쉼표 및 기호를 제거하고 숫자만 설정
            document.getElementById('availableAmount').innerText = `₩${account.available.toLocaleString()}`;
        }
    } else {
        alert("출금 한도를 입력해주세요.");
    }
});

function changePassword() {
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

    // 비밀번호 길이 검증 (예: 최소 8자리 이상)
    if (newPassword.length < 8) {
        alert("새 비밀번호는 최소 8자 이상이어야 합니다.");
        return;
    }

    // 비밀번호 변경 처리 로직 (서버와의 통신 등)
    alert("비밀번호가 성공적으로 변경되었습니다.");

    // 모달 닫기 (Bootstrap 5에서 JavaScript로 모달을 닫는 방법)
    const modalElement = document.getElementById('passwordChangeModal');  // 모달 요소 참조
    const modal = bootstrap.Modal.getInstance(modalElement);  // 이미 열린 모달의 인스턴스를 가져옵니다.
    modal.hide();  // 모달을 닫습니다.
}

var modalElement = document.getElementById('dailyLimitModal');
var modal = new bootstrap.Modal(modalElement, {
    backdrop: 'static',  // 배경 클릭으로 모달을 닫지 않게 설정
    keyboard: false      // ESC로 모달 닫히지 않도록 설정
});

document.getElementById('setLimitBtn').addEventListener('click', function() {
    modal.show();
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
