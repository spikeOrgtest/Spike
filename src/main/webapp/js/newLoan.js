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

// 세부상품선택
document.getElementById('loan_name').addEventListener('change', function() {
	const selectedType = this.value;
	const productSelect = document.getElementById('product_type');
	const productSelectContainer = document.getElementById('product_select');

	// 기존 옵션 초기화
	productSelect.innerHTML = '';

	let options = [];

	if (selectedType === '신용대출') {
		options = [
			{ value: 'spike_savings', text: 'SPIKE 대출' },
			{ value: 'housing_savings', text: '주택청약' }
		];
	} else if (selectedType === '담보대출') {
		options = [
			{ value: 'spike_installment', text: 'SPIKE 적금' },
			{ value: 'regular_installment', text: '정기적금' }
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
});
/*
window.addEventListener('load', function() {
	const loanTypeSelect = document.getElementById('loan_name');
	loanTypeSelect.value = 'SPIKE 대출'; // 기본값 설정
	loanTypeSelect.dispatchEvent(new Event('change'));  // 'change' 이벤트 강제 실행
});
*/