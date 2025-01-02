// 자산 추이 그래프
var ctx = document.getElementById('assetChart').getContext('2d');
var assetChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['1주', '2주', '3주', '4주'],
        datasets: [{
            label: '자산 변화',
            data: [10000000, 10500000, 11000000, 11500000],
            borderColor: 'rgba(75, 192, 192, 1)',
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            fill: true,
            tension: 0.1
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: { position: 'top' },
            tooltip: { enabled: true }
        }
    }
});

// 대출 내역 데이터를 동적으로 삽입
const loanDetails = {
    loanAmount: '₩3,000,000',
    interestRate: '3.5%',
    remainingPeriod: '5년 3개월',
    repaymentType: '월 상환',
    monthlyRepayment: '₩50,000',
    nextRepaymentDate: '2024-12-25',
};

const loanModalContent = document.querySelector('#loanModal .modal-body');

// 대출 내역 업데이트 함수
const updateLoanModalContent = () => {
    const { loanAmount, interestRate, remainingPeriod, repaymentType, monthlyRepayment, nextRepaymentDate } = loanDetails;
    loanModalContent.innerHTML = `
        <h5>대출 상세 정보</h5>
        <ul>
            <li><span class="icon-success">✔</span><strong>대출금액:</strong> ${loanAmount}</li>
            <li><span class="icon-warning">⚠</span><strong>이자율:</strong> ${interestRate}</li>
            <li><span class="icon-danger">✖</span><strong>잔여 기간:</strong> ${remainingPeriod}</li>
            <li><span class="icon">📅</span><strong>상환 방식:</strong> ${repaymentType}</li>
            <li><span class="icon">💸</span><strong>매월 상환액:</strong> ${monthlyRepayment}</li>
            <li><span class="icon">🗓</span><strong>다음 상환일:</strong> ${nextRepaymentDate}</li>
        </ul>
    `;
};

// 예/적금 내역 데이터를 동적으로 삽입
const savingsDetails = {
    depositAmount: '₩1,000,000',
    savingsAmount: '₩500,000',
    interestRate: '2.5%',
    depositMaturityDate: '2025-12-25',
    savingsMaturityDate: '2026-06-25',
};

const savingsModalContent = document.querySelector('#savingsModal .modal-body');

// 예/적금 내역 업데이트 함수
const updateSavingsModalContent = () => {
    const { depositAmount, savingsAmount, interestRate, depositMaturityDate, savingsMaturityDate } = savingsDetails;
    savingsModalContent.innerHTML = `
        <h5>예금 상세 정보</h5>
        <ul>
            <li><strong>예금금액:</strong> ${depositAmount}</li>
            <li><strong>이자율:</strong> ${interestRate}</li>
            <li><strong>만기일:</strong> ${depositMaturityDate}</li>
            <li><strong>예금 유형:</strong> 정기예금</li>
        </ul>

        <h5>적금 상세 정보</h5>
        <ul>
            <li><strong>적금금액:</strong> ${savingsAmount}</li>
            <li><strong>이자율:</strong> 2.0%</li>
            <li><strong>만기일:</strong> ${savingsMaturityDate}</li>
            <li><strong>적금 유형:</strong> 월납 적금</li>
        </ul>
    `;
};

// 모달 열 때 데이터 업데이트
document.querySelector('#loanButton').addEventListener('click', () => {
    updateLoanModalContent();
    openModal(document.getElementById('loanModal'));
});

document.querySelector('#savingsButton').addEventListener('click', () => {
    updateSavingsModalContent();
    openModal(document.getElementById('savingsModal'));
});

// 대출 상세 내역을 클릭하면 강조 표시하기
const loanItems = document.querySelectorAll('#loanModal .modal-body ul li');
loanItems.forEach(item => {
    item.addEventListener('click', (e) => {
        item.classList.toggle('highlight');
    });
});

// 예/적금 상세 내역을 클릭하면 강조 표시하기
const savingsItems = document.querySelectorAll('#savingsModal .modal-body ul li');
savingsItems.forEach(item => {
    item.addEventListener('click', (e) => {
        item.classList.toggle('highlight');
    });
});

// 모달 열기 함수
const openModal = (modal) => {
    const bootstrapModal = new bootstrap.Modal(modal);
    bootstrapModal.show();
};
