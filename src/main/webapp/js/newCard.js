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

	// 카드번호 랜덤 생성
	function generateAccountNumber() {
		const numbers = Array.from({ length: 16 }, () => Math.floor(Math.random() * 10));
		return `${numbers.slice(0, 4).join('')}-${numbers.slice(4, 8).join('')}-${numbers.slice(8, 12).join('')}-${numbers.slice(12).join('')}`;
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
			{ value: 'spike_savings', text: 'SPIKE 예금' },
			{ value: 'housing_savings', text: '주택청약' }
		];
	} else if (selectedType === '적금') {
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