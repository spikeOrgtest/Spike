// URL에서 쿼리 파라미터를 읽어오는 함수
function getQueryParameter(name) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(name);
}

// 페이지 로드 시 기본값 설정
window.addEventListener('load', function() {
    const loanTypeSelect = document.getElementById('loan_name');
    const productSelect = document.getElementById('product_type');
    const amountSelect = document.getElementById('amount_select');

    const selectedProduct = getQueryParameter('selectedProduct'); // 선택된 상품 가져오기

    // 대출 상품 유형 설정
    loanTypeSelect.value = '대출상품'; // 기본값 설정
    loanTypeSelect.dispatchEvent(new Event('change')); // 'change' 이벤트 강제 실행

    // 상품 유형에 맞는 세부 상품 선택
    if (selectedProduct) {
        productSelect.value = selectedProduct; // 선택된 상품으로 설정
    } else {
        // 기본값 설정 (각 페이지에 맞는 기본 상품)
        if (window.location.pathname.includes('Subpage_L1')) {
            productSelect.value = 'product1'; // L1 페이지의 기본 상품
        } else if (window.location.pathname.includes('Subpage_L2')) {
            productSelect.value = 'product2'; // L2 페이지의 기본 상품
        } else if (window.location.pathname.includes('Subpage_L3')) {
            productSelect.value = 'product3'; // L3 페이지의 기본 상품
        } else if (window.location.pathname.includes('Subpage_L4')) {
            productSelect.value = 'product4'; // L4 페이지의 기본 상품
        } else if (window.location.pathname.includes('Subpage_L5')) {
            productSelect.value = 'product5'; // L5 페이지의 기본 상품
        } else if (window.location.pathname.includes('Subpage_L6')) {
            productSelect.value = 'product6'; // L6 페이지의 기본 상품
        }
    }

    productSelect.dispatchEvent(new Event('change')); // 'change' 이벤트 강제 실행
});

// 대출상품 선택 시 금액 범위 설정
document.getElementById('loan_name').addEventListener('change', function() {
    const selectedType = this.value;
    const productSelect = document.getElementById('product_type');
    const amountSelect = document.getElementById('amount_select');

    // 기존 옵션 초기화
    productSelect.innerHTML = '';
    amountSelect.innerHTML = ''; // 금액 선택 초기화

    let options = [];

    // 대출 상품 목록 설정
    if (selectedType === '대출상품') {
        options = [
            { value: 'product1', text: '학자금 대출', amountRange: [1000000, 10000000] },
            { value: 'product2', text: '비상금 대출', amountRange: [1000000, 3000000] },
            { value: 'product3', text: '직장인 대출', amountRange: [5000000, 10000000] },
            { value: 'product4', text: 'SPIKE 대출', amountRange: [5000000, 10000000] },
            { value: 'product5', text: '주택담보 대출', amountRange: [5000000, 10000000] },
            { value: 'product6', text: '소상공인 대출', amountRange: [5000000, 10000000] }
        ];
    }

    // 옵션 추가
    options.forEach(option => {
        const newOption = document.createElement('option');
        newOption.value = option.value;
        newOption.textContent = option.text;
        productSelect.appendChild(newOption);
    });

    // 세부 상품 선택 영역 보여주기
    productSelect.dispatchEvent(new Event('change'));
});

// 대출상품 선택 시 금액 범위 설정
document.getElementById('product_type').addEventListener('change', function() {
    const selectedProduct = this.value;
    const amountSelect = document.getElementById('amount_select');

    // 상품에 맞는 금액 범위 설정
    let amountRange = [0, 0];
    if (selectedProduct === 'product1') {
        amountRange = [1000000, 10000000];
    } else if (selectedProduct === 'product2') {
        amountRange = [1000000, 3000000];
    } else if (selectedProduct === 'product3') {
        amountRange = [1000000, 15000000];
    } else if (selectedProduct === 'product4') {
        amountRange = [1000000, 50000000];
    } else if (selectedProduct === 'product5') {
        amountRange = [10000000, 300000000];
    } else if (selectedProduct === 'product6') {
        amountRange = [1000000, 100000000];
    }

    // 금액 선택 옵션 동적으로 생성
    amountSelect.innerHTML = ''; // 기존 옵션 초기화
    for (let i = amountRange[0]; i <= amountRange[1]; i += 1000000) { // 100만원 단위로 증가
        const option = document.createElement('option');
        option.value = i;
        option.textContent = `${i.toLocaleString()} 원`;
        amountSelect.appendChild(option);
    }

    // 금액 선택 영역 보여주기
    amountSelect.style.display = amountSelect.options.length > 0 ? 'block' : 'none';
});
