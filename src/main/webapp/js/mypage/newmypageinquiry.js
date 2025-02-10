/**
 * mypageinquiry.js 모듈화 버전
 */
document.addEventListener('DOMContentLoaded', function () {
    initEventListeners(); // 모든 이벤트 리스너 초기화
});

// 📌 1. 계좌 정보 업데이트 함수
function updateAccountInfo() {
    const selectedAccount = document.getElementById('accountSelect').value;
    if (selectedAccount) {
        const account = accountData[selectedAccount];

        // 잔액 업데이트
        document.getElementById('balanceAmount').innerText = `${formatNumber(account.balance)} 원`;
        document.getElementById('daylimit').innerText = `${formatNumber(account.daylimit)} 원`;
        document.getElementById('onelimit').innerText = `${formatNumber(account.onelimit)} 원`;

        const accountNumber = selectedAccount.match(/[\d-]+/)[0];
        document.getElementById('selectedAccountNumber1').value = accountNumber;
        document.getElementById('selectedAccountNumber2').value = accountNumber;
    }
}

// 📌 2. 숫자에 쉼표 추가하는 함수
function formatNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 📌 3. 거래 내역 필터링 함수
function filterTransactionHistory() {
    const selectedAccount = document.getElementById('accountSelect').value;
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    const transactionHistoryContainer = document.getElementById('transactionHistoryContainer');
    const noTransactionsMessage = document.getElementById('noTransactionsMessage');
    const transactionHistoryList = document.getElementById("transactionHistory");

    transactionHistoryList.innerHTML = ""; // 기존 내역 초기화

    if (!selectedAccount) {
        alert("계좌를 선택해주세요.");
        return;
    }

    if (!startDate || !endDate) {
        alert("시작일과 종료일을 모두 선택해주세요.");
        return;
    }

    const account = accountData[selectedAccount];
    let filteredTransactions = account.transactions.filter(transaction => {
        const transactionDate = new Date(transaction.date);
        return transactionDate >= new Date(startDate) && transactionDate <= new Date(endDate);
    });

    if (filteredTransactions.length > 0) {
        updateTransactionHistory(filteredTransactions);
        transactionHistoryContainer.style.display = "block";
        noTransactionsMessage.style.display = "none";
    } else {
        transactionHistoryContainer.style.display = "none";
        noTransactionsMessage.style.display = "block";
    }
}

// 📌 4. 거래 내역 업데이트 함수
function updateTransactionHistory(transactions) {
    const transactionHistoryList = document.getElementById("transactionHistory");

    transactions.forEach(transaction => {
        const listItem = document.createElement("li");
        listItem.classList.add("list-group-item", "d-flex", "justify-content-between", "align-items-center");
        listItem.innerHTML = `
            <span>${transaction.date} - ${transaction.memo}</span>
            <span class="fw-bold ${transaction.amount < 0 ? 'text-danger' : 'text-success'}">
                ${transaction.amount.toLocaleString()} 원
            </span>
        `;
        transactionHistoryList.appendChild(listItem);
    });
}

// 📌 5. 출금 한도 설정 함수
function limitChange(event) {
    event.preventDefault();
    const dayLimit = document.getElementById('dayLimitInput').value;
    const oneLimit = document.getElementById('oneLimitInput').value;
    const form = document.getElementById('limit');

    form.querySelector('[name="day_limit"]').value = dayLimit;
    form.querySelector('[name="one_limit"]').value = oneLimit;
    form.submit();
}

// 📌 6. 비밀번호 변경 함수
function changePassword(event) {
    event.preventDefault();

    const currentPassword = document.getElementById("currentPassword").value;
    const newPassword = document.getElementById("newPassword").value;
    const confirmPassword = document.getElementById("confirmPassword").value;

    if (!currentPassword || !newPassword || !confirmPassword) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    if (newPassword !== confirmPassword) {
        alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        return;
    }

    if (newPassword.length < 6) {
        alert("새 비밀번호는 최소 6자 이상이어야 합니다.");
        return;
    }

    document.getElementById('confirmPassword').value = '';
    document.getElementById('passwordChangeForm').submit();

    // 모달 닫기
    const modalElement = document.getElementById('passwordChangeModal');
    const modal = bootstrap.Modal.getInstance(modalElement);
    modal.hide();
}

// 📌 7. 모달 관련 초기화
function initModalHandling() {
    document.getElementById('setLimitBtn').addEventListener('click', function() {
        const selectAccount = document.getElementById("accountSelect").value;
        if (!selectAccount) {
            alert("계좌를 선택해주세요.");
            return;
        }
        const myModal = new bootstrap.Modal(document.getElementById('dailyLimitModal'));
        myModal.show();
    });

    document.getElementById('changePasswordModalBtn').addEventListener('click', function() {
        const selectAccount = document.getElementById("accountSelect").value;
        if (!selectAccount) {
            alert("계좌를 선택해주세요.");
            return;
        }
        const myModal = new bootstrap.Modal(document.getElementById('passwordChangeModal'));
        myModal.show();
    });
}

// 📌 8. 이벤트 리스너 초기화
function initEventListeners() {
    document.getElementById('accountSelect').addEventListener('change', updateAccountInfo);
    document.getElementById('filterBtn').addEventListener('click', filterTransactionHistory);
    document.getElementById('saveLimitBtn').addEventListener('click', limitChange);
    document.getElementById('changePasswordBtn').addEventListener('click', changePassword);
    document.getElementById('startDate').addEventListener('change', () => document.getElementById('transactionHistoryContainer').style.display = 'none');
    document.getElementById('endDate').addEventListener('change', () => document.getElementById('transactionHistoryContainer').style.display = 'none');
    initModalHandling();
}
