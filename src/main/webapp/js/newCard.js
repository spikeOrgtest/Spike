document.addEventListener('DOMContentLoaded', function() {
	const form = document.getElementById('signupForm');
	const card_password = document.getElementById('card_password');
	const confirmPassword = document.getElementById('confirmPassword');
	const cardInfo = document.getElementById('cardInfo');
	const cardNumberSpan = document.getElementById('cardNumber');
	const overseasPaymentField = document.getElementById('overseas_payment_value');
	const transportationCardField = document.getElementById('transportation_card_value');

	form.addEventListener('submit', function(e) {
		e.preventDefault(); // 기본 폼 제출 방지

		// 해외결제 선택
		const overseasPayment = document.querySelector('input[name="option"]:checked');
		if (overseasPayment) {
			overseasPaymentField.value = overseasPayment.value;
		}

		// 후불교통카드 선택 값 처리
		const transportationCard = document.querySelector('input[name="option2"]:checked');
		if (transportationCard) {
			transportationCardField.value = transportationCard.value;
		}

		if (validateForm()) {
			const newCardNumber = generateCardNumber();
			document.getElementById('card_number').value = newCardNumber;
			cardNumberSpan.textContent = newCardNumber;
			cardInfo.classList.remove('hidden');
			form.submit();
		}
	});


	// 비밀번호 검증
	card_password.addEventListener('input', validatePassword);
	confirmPassword.addEventListener('input', validatePasswordMatch);

	function validateForm() {
		return validatePassword() && validatePasswordMatch();
	}

	function validatePassword() {
		const passwordRegex = /^[0-9]{6}$/; // 6자리 숫자
		const isValid = passwordRegex.test(card_password.value);
		card_password.setCustomValidity(isValid ? '' : '비밀번호는 6자리 숫자여야 합니다.');
		return isValid;
	}

	function validatePasswordMatch() {
		const isValid = card_password.value === confirmPassword.value;
		confirmPassword.setCustomValidity(isValid ? '' : '비밀번호가 일치하지 않습니다.');
		return isValid;
	}

	// 카드번호 랜덤 생성
	function generateCardNumber() {
		const numbers = Array.from({ length: 16 }, () => Math.floor(Math.random() * 10));
		return `${numbers.slice(0, 4).join('')}-${numbers.slice(4, 8).join('')}-${numbers.slice(8, 12).join('')}-${numbers.slice(12).join('')}`;
	}
});

// 세부상품선택
document.getElementById('card_name').addEventListener('change', function() {
	const selectedType = this.value;
	const productSelect = document.getElementById('product_type');
	const productSelectContainer = document.getElementById('product_select');

	// 기존 옵션 초기화
	productSelect.innerHTML = '';

	let options = [];

	if (selectedType === 'SPIKE 카드') {
		options = [
			{ value: 'YOUTHCARD', text: 'SPIKE 청년 카드' },
			{ value: 'PLATINUMCARD', text: '플래티넘 카드' },
			{ value: 'DIGITALCARD', text: '디지털 카드' },
			{ value: 'SPIKECARD', text: 'SPIKE 카드' },
			{ value: 'TRAVELCARD', text: 'SPIKE TRAVEL 카드' },
			{ value: 'PLUSCARD', text: '플러스 카드' }
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

window.addEventListener('load', function() {
	const cardTypeSelect = document.getElementById('card_name');
	cardTypeSelect.value = 'SPIKE 카드'; // 기본값 설정
	cardTypeSelect.dispatchEvent(new Event('change'));  // 'change' 이벤트 강제 실행
});
