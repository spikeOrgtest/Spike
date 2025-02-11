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
            productSelect.value = '학자금대출';
        } else if (window.location.pathname.includes('Subpage_L2')) {
            productSelect.value = '비상금대출';
        } else if (window.location.pathname.includes('Subpage_L3')) {
            productSelect.value = '직장인대출';
        } else if (window.location.pathname.includes('Subpage_L4')) {
            productSelect.value = 'SPIKE대출';
        } else if (window.location.pathname.includes('Subpage_L5')) {
            productSelect.value = '주택담보대출';
        } else if (window.location.pathname.includes('Subpage_L6')) {
            productSelect.value = '소상공인대출';
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
            { value: '학자금대출', text: '학자금 대출', amountRange: [1000000, 10000000] },
            { value: '비상금대출', text: '비상금 대출', amountRange: [1000000, 3000000] },
            { value: '직장인대출', text: '직장인 대출', amountRange: [5000000, 10000000] },
            { value: 'SPIKE대출', text: 'SPIKE 대출', amountRange: [5000000, 10000000] },
            { value: '주택담보대출', text: '주택담보 대출', amountRange: [5000000, 10000000] },
            { value: '소상공인대출', text: '소상공인 대출', amountRange: [5000000, 10000000] }
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
    switch(selectedProduct) {
        case '학자금대출':
            amountRange = [1000000, 10000000];
            break;
        case '비상금대출':
            amountRange = [1000000, 3000000];
            break;
        case '직장인대출':
            amountRange = [1000000, 15000000];
            break;
        case 'SPIKE대출':
            amountRange = [1000000, 50000000];
            break;
        case '주택담보대출':
            amountRange = [10000000, 300000000];
            break;
        case '소상공인대출':
            amountRange = [1000000, 100000000];
            break;
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
