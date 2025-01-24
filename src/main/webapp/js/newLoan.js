document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('signupForm');
	const loanInfo = document.getElementById('loanInfo');

	form.addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 폼 제출 방지

		if (validateForm()) {
			loanInfo.classList.remove('hidden');
			alert(loanInfo);
			form.submit();
		}
	});
});

// 대출상품선택 및 금액 설정
document.getElementById('loan_name').addEventListener('change', function() {
	const selectedType = this.value;
	const productSelect = document.getElementById('product_type');
	const productSelectContainer = document.getElementById('product_select');
	const amountSelectContainer = document.getElementById('amount_select'); // 금액 선택 필드 컨테이너
	const amountSelect = document.getElementById('amount_select'); // 금액 선택 셀렉트 박스

	// 기존 옵션 초기화
	productSelect.innerHTML = '';
	amountSelect.innerHTML = ''; // 금액 선택 초기화
	amountSelectContainer.style.display = 'none'; // 금액 선택 숨기기

	let options = [];

	// 대출 상품 목록 설정
	if (selectedType === '대출') {
		options = [
			{ value: 'product1', text: '학자금 대출', amountRange: [1000000, 10000000] },
			{ value: 'product2', text: '비상금 대출', amountRange: [1000000, 3000000] },
			{ value: 'product3', text: '대출상품 3', amountRange: [5000000, 10000000] }
		];
	} else if (selectedType === '그냥대출') {
		options = [
			{ value: 'product4', text: '대출상품 4', amountRange: [0, 1000000] }
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
	productSelectContainer.style.display = options.length > 0 ? 'block' : 'none';
	
	productSelect.dispatchEvent(new Event('change'));
});

// 대출상품 선택 시 금액 범위 설정
document.getElementById('product_type').addEventListener('change', function() {
	const selectedProduct = this.value;
	const amountSelect = document.getElementById('amount_select');
	const amountSelectContainer = document.getElementById('amount_select'); // 금액 선택 필드 컨테이너

	// 상품에 맞는 금액 범위 설정
	let amountRange = [0, 0];
	if (selectedProduct === 'product1') {
		amountRange = [1000000, 10000000];
	} else if (selectedProduct === 'product2') {
		amountRange = [2000000, 5000000];
	} else if (selectedProduct === 'product3') {
		amountRange = [5000000, 10000000];
	} else if (selectedProduct === 'product4') {
		amountRange = [0, 1000000];
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
	amountSelectContainer.style.display = amountSelect.options.length > 0 ? 'block' : 'none';
});

// 페이지 로드 시 기본값 설정
window.addEventListener('load', function() {
	const loanTypeSelect = document.getElementById('loan_name');
	const productSelect = document.getElementById('product_type');
	loanTypeSelect.value = '대출'; // 기본값 설정
	loanTypeSelect.dispatchEvent(new Event('change'));  // 'change' 이벤트 강제 실행
	productSelect.value = 'product1';
	productSelect.dispatchEvent(new Event('change'));
});
