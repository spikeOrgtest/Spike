document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('signupForm');
	const account_password = document.getElementById('account_password');
	const confirmPassword = document.getElementById('confirmPassword');
	const accountInfo = document.getElementById('accountInfo');
	const accountNumberSpan = document.getElementById('accountNumber');

	form.addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 폼 제출 방지

		if (validateForm()) {
			const newAccountNumber = generateAccountNumber();
			document.getElementById('account_number').value = newAccountNumber;
			accountNumberSpan.textContent = newAccountNumber;
			accountInfo.classList.remove('hidden');
			form.submit();
		}
	});

	// 비밀번호 검증
	account_password.addEventListener('input', validatePassword);
	confirmPassword.addEventListener('input', validatePasswordMatch);

	function validateForm() {
		return validatePassword() && validatePasswordMatch();
	}

	function validatePassword() {
		const passwordRegex = /^[0-9]{6}$/; // 6자리 숫자
		const isValid = passwordRegex.test(account_password.value);
		account_password.setCustomValidity(isValid ? '' : '비밀번호는 6자리 숫자여야 합니다.');
		return isValid;
	}

	function validatePasswordMatch() {
		const isValid = account_password.value === confirmPassword.value;
		confirmPassword.setCustomValidity(isValid ? '' : '비밀번호가 일치하지 않습니다.');
		return isValid;
	}

	// 계좌번호 랜덤 생성
	function generateAccountNumber() {
		const numbers = Array.from({ length: 13 }, () => Math.floor(Math.random() * 10));
		return `${numbers.slice(0, 3).join('')}-${numbers.slice(3, 7).join('')}-${numbers.slice(7, 11).join('')}-${numbers.slice(11).join('')}`;
	}
});

// 세부상품선택
document.getElementById('account_type').addEventListener('change', function() {
	const selectedType = this.value;
	const productSelect = document.getElementById('product_type');
	const productSelectContainer = document.getElementById('product_select');

	// 기존 옵션 초기화
	productSelect.innerHTML = '';

	let options = [];

	if (selectedType === '예금') {
		options = [
			{ value: 'spikeDeposit', text: 'SPIKE 예금' },
			{ value: 'IRP', text: 'IRP (Individual Retirement Pension)' },
			{ value: 'plus', text: '1+1 예금' },
			{ value: 'regular', text: '정기 예금' },
			{ value: 'spike', text: '~~예금' },
			{ value: 'family', text: '평생가족 예금' }
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

// 옵션 변경시 H1 태그 변경
document.getElementById('product_type').addEventListener('change', function() {
	const selectedProduct = this.value;
	const header = document.querySelector('h1'); // <h1> 태그를 선택
	let headerText = '';

	if (selectedProduct === 'spikeDeposit') {
		headerText = 'SPIKE 예금'; // SPIKE 예금 또는 적금 선택 시
	} else if (selectedProduct === 'IRP') {
		headerText = 'IRP (Individual Retirement Pension)'; // 주택청약 선택 시
	} else if (selectedProduct === 'plus') {
		headerText = '1+1 예금'; // 정기적금 선택 시
	} else if (selectedProduct === 'regular') {
		headerText = '정기 예금'; // 정기적금 선택 시
	} else if (selectedProduct === 'spike') {
		headerText = '~~예금'; // 정기적금 선택 시
	} else if (selectedProduct === 'family') {
		headerText = '평생가족 예금'; // 정기적금 선택 시
	}

	if (header) {
		header.textContent = headerText;
	}
});

window.addEventListener('load', function() {
	const accountTypeSelect = document.getElementById('account_type');
	accountTypeSelect.value = '예금';  // 기본값 '예금'으로 설정
	accountTypeSelect.dispatchEvent(new Event('change'));  // 'change' 이벤트 강제 실행
});