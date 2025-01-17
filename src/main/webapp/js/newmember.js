document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('signupForm');
	const password = document.getElementById('password');
	const confirmPassword = document.getElementById('confirmPassword');
	const accountInfo = document.getElementById('accountInfo');
	const accountNumberSpan = document.getElementById('accountNumber');

	form.addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 폼 제출 방지

		if (validateForm()) {
			const newAccountNumber = generateAccountNumber();
			accountNumberSpan.textContent = newAccountNumber;
			accountInfo.classList.remove('hidden');
			form.submit();
		}
	});

	// 비밀번호 검증
	password.addEventListener('input', validatePassword);
	confirmPassword.addEventListener('input', validatePasswordMatch);

	function validateForm() {
		return validatePassword() && validatePasswordMatch();
	}

	function validatePassword() {
		const passwordRegex = /^[0-9]{6}$/; // 6자리 숫자
		const isValid = passwordRegex.test(password.value);
		password.setCustomValidity(isValid ? '' : '비밀번호는 6자리 숫자여야 합니다.');
		return isValid;
	}

	function validatePasswordMatch() {
		const isValid = password.value === confirmPassword.value;
		confirmPassword.setCustomValidity(isValid ? '' : '비밀번호가 일치하지 않습니다.');
		return isValid;
	}

	function generateAccountNumber() {
		const numbers = Array.from({ length: 13 }, () => Math.floor(Math.random() * 10));
		return `${numbers.slice(0, 3).join('')}-${numbers.slice(3, 7).join('')}-${numbers.slice(7, 11).join('')}-${numbers.slice(11).join('')}`;
	}
});
