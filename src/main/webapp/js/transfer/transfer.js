  // 출금계좌 정보 업데이트 함수
  function updateAccountInfo() {
    const accountSelect = document.getElementById("fromAccount");
    const selectedOption = accountSelect.options[accountSelect.selectedIndex];

    const availableAmount = selectedOption.getAttribute("data-available");
    const balanceAmount = selectedOption.getAttribute("data-balance");

    document.getElementById("availableAmount").textContent = formatCurrency(availableAmount) + " 원";
    document.getElementById("balanceAmount").textContent = formatCurrency(balanceAmount) + " 원";
  }

// 숫자를 통화 형식으로 포맷하는 함수
function formatCurrency(amount) {
  return parseInt(amount).toLocaleString("ko-KR");
}

// 은행별 계좌번호 패턴 정의
const accountPatterns = {
  "우리은행": /^(\d{4})(\d{3})(\d{6})$/,
  "국민은행": /^(\d{3})(\d{2})(\d{6})(\d{3})$/,
  "신한은행": /^(\d{3})(\d{2})(\d{6})$/,
  "하나은행": /^(\d{3})(\d{6})(\d{5})$/
};

// 계좌번호 입력 시 자동 하이픈 삽입
document.getElementById("toAccount").addEventListener("input", function () {
  const bank = document.getElementById("depositBank").value;
  const input = this.value.replace(/[^0-9]/g, ""); // 숫자만 추출
  const pattern = accountPatterns[bank];

  if (pattern) {
    const formatted = input.match(pattern);
    if (formatted) {
      this.value = formatted.slice(1).join("-");
    } else {
      this.value = input; // 패턴이 맞지 않으면 그대로
    }
  } else {
    this.value = input; // 은행 미선택 시 숫자만 표시
  }
});

// 이체 금액 입력 시 세 자리마다 콤마 추가 (입력 필드에 콤마 없이 값 유지)
document.getElementById("amount").addEventListener("input", function () {
  const rawValue = this.value.replace(/[^0-9]/g, ""); // 숫자만 남김
  
  if (!isNaN(rawValue) && rawValue.length > 0) {
    this.dataset.raw = rawValue; // 실제 값은 dataset에 저장
    this.value = parseInt(rawValue, 10).toLocaleString("ko-KR"); // 화면에 콤마 추가된 값 표시
  } else {
    this.dataset.raw = ""; // 값이 없으면 초기화
    this.value = ""; 
  }
});

function completeTransfer() {
  const accountSelect = document.getElementById("fromAccount");
  const selectedOption = accountSelect.options[accountSelect.selectedIndex];

  const fromAccount = accountSelect.value;
  const depositBank = document.getElementById("depositBank").value;
  const toAccount = document.getElementById("toAccount").value;
  const rawAmount = document.getElementById("amount").dataset.raw; // 실제 숫자 값
  const transferAmount = parseInt(rawAmount, 10); // 콤마 없는 값으로 변환
  const availableAmount = parseInt(selectedOption.getAttribute("data-available"), 10);
  const balanceAmount = parseInt(selectedOption.getAttribute("data-balance"), 10);
  const note = document.getElementById("note").value.trim(); // 이체 메모 값 가져오기

  // 각 항목별로 입력값 검증
  if (!fromAccount) {
    alert("출금계좌를 선택해주세요!");
    return;
  }

  if (!depositBank) {
    alert("입금은행을 선택해주세요!");
    return;
  }

  if (!toAccount) {
    alert("계좌번호를 입력해주세요!");
    return;
  }

  if (isNaN(transferAmount) || transferAmount <= 0) {
    alert("이체금액을 올바르게 입력해주세요!");
    return;
  }

  // 잔액 부족 여부 확인
  if (transferAmount > availableAmount) {
    alert("일일한도 금액이 부족합니다!");
    return;
  }

  // 잔액 및 출금 가능 금액 차감
  const newAvailableAmount = availableAmount - transferAmount;
  const newBalanceAmount = balanceAmount - transferAmount;

  // 화면에 업데이트
  document.getElementById("availableAmount").textContent = formatCurrency(newAvailableAmount) + " 원";
  document.getElementById("balanceAmount").textContent = formatCurrency(newBalanceAmount) + " 원";

  // 선택된 옵션에 새로운 금액 저장 (출금 계좌 상태 업데이트)
  selectedOption.setAttribute("data-available", newAvailableAmount);
  selectedOption.setAttribute("data-balance", newBalanceAmount);

 // 송금 완료 알림 메시지
  alert(`송금이 완료되었습니다! \n\n출금계좌: ${fromAccount}\n입금은행: ${depositBank}\n입금계좌: ${toAccount}\n이체금액: ${formatCurrency(transferAmount)} 원\n${note ? '메모: ' + note : ''}`);

  // 송금 내역에 추가
  const transferHistory = document.getElementById("transferHistory");
  const newHistoryItem = document.createElement("li");
  newHistoryItem.className = "list-group-item d-flex justify-content-between align-items-center mb-3 shadow-sm border-start-0 border-end-0";
  newHistoryItem.innerHTML = `
    <div class="d-flex align-items-center">
      <i class="bi bi-arrow-right-circle-fill text-primary me-2"></i>
      <span>출금계좌: <strong>${fromAccount}</strong> → 입금계좌: <strong>${depositBank} (${toAccount})</strong></span>
    </div>
    <div class="text-end">
      <strong>${formatCurrency(transferAmount)} 원</strong>
      ${note ? `<p class="mt-2"><strong>메모: ${note}</strong></p>` : ''}
    </div>
  `;
  transferHistory.appendChild(newHistoryItem);

  // 입력 필드 초기화
  document.getElementById("depositBank").selectedIndex = 0;
  document.getElementById("toAccount").value = "";
  document.getElementById("amount").value = "";
  document.getElementById("amount").dataset.raw = ""; // 초기화
  document.getElementById("note").value = ""; // 메모 초기화
}
