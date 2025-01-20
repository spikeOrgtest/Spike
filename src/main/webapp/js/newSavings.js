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

document.addEventListener('DOMContentLoaded', function() {
	const header = document.querySelector('h1'); // 상품 이름을 표시하는 h1
	const joinButton = document.getElementById('joinButton'); // 계좌 개설 버튼
	const productMapping = {
		'spikeSavings': 'SPIKE 적금',
		'youth': '청년 저축 적금',
		'home': '청년 주택드림',
		'regular': '정기적금',
		'dream': '드림 적금',
		'plus': '플러스 적금',
	};

	// URL 경로에 맞는 기본값 설정
	const path = window.location.pathname;
	let selectedProduct = 'spikeSavings';  // 기본값은 SPIKE 적금

	if (path.includes('subpage_s1')) {
		selectedProduct = 'spikeSavings';
	} else if (path.includes('subpage_s2')) {
		selectedProduct = 'youth';
	} else if (path.includes('subpage_s3')) {
		selectedProduct = 'home';
	} else if (path.includes('subpage_s4')) {
		selectedProduct = 'regular';
	} else if (path.includes('subpage_s5')) {
		selectedProduct = 'dream';
	} else if (path.includes('subpage_s6')) {
		selectedProduct = 'plus';
	}

	// 페이지 로드 시 기본값에 맞게 텍스트 설정
	if (header) {
		header.textContent = productMapping[selectedProduct];
	}

	// 계좌 개설 버튼 클릭 시 기본값에 맞는 상품 정보로 알림 표시
	joinButton.addEventListener('click', function() {
		const url = `../newsavings.jsp?product=${selectedProduct}`; // 상품 정보를 URL로 전달
		window.location.href = url; // 해당 URL로 리디렉션
	});
});



/*
// 세부상품선택
document.getElementById('account_type').addEventListener('change', function() {
	const selectedType = this.value;
	const productSelect = document.getElementById('product_type');
	const productSelectContainer = document.getElementById('product_select');

	// 기존 옵션 초기화
	productSelect.innerHTML = '';

	let options = [];

	if (selectedType === '적금') {
		options = [
			{ value: 'spikeSavings', text: 'SPIKE 적금' },
			{ value: 'youth', text: '청년 저축 적금' },
			{ value: 'home', text: '청년 주택드림' },
			{ value: 'regular', text: '정기적금' },
			{ value: 'dream', text: '드림 적금' },
			{ value: 'plus', text: '플러스 적금' }
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

	if (selectedProduct === 'spikeSavings') {
		headerText = 'SPIKE 적금'; // SPIKE 예금 또는 적금 선택 시
	} else if (selectedProduct === 'youth') {
		headerText = '청년 저축 적금'; // 주택청약 선택 시
	} else if (selectedProduct === 'home') {
		headerText = '청년 주택드림'; // 정기적금 선택 시
	} else if (selectedProduct === 'regular') {
		headerText = '정기적금'; // 정기적금 선택 시
	} else if (selectedProduct === 'dream') {
		headerText = '드림 적금'; // 정기적금 선택 시
	} else if (selectedProduct === 'plus') {
		headerText = '플러스 적금'; // 정기적금 선택 시
	}

	if (header) {
		header.textContent = headerText;
	}
});

window.addEventListener('load', function() {
	const accountTypeSelect = document.getElementById('account_type');
	accountTypeSelect.value = '적금';
	accountTypeSelect.dispatchEvent(new Event('change'));
}); */