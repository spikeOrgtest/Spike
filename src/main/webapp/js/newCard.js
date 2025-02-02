// 페이지 로드 시 실행
window.addEventListener('load', function() {
    const cardTypeSelect = document.getElementById('card_name');
    
    if (selectedCard && selectedCard != 'null') {
        Array.from(cardTypeSelect.options).forEach(option => {
            if (option.value === selectedCard) {
                option.selected = true;
            }
        });
    }
    
    const event = new Event('change');
    cardTypeSelect.dispatchEvent(event);
});

// 카드 선택 시 이미지와 제목 변경
document.getElementById('card_name').addEventListener('change', function() {
    const selectedType = this.value;
    const cardImage = document.querySelector('.container img');
    const title = document.querySelector('.container h1');

    const imageMap = {
        'SPIKE 청년 카드': '../../../images/product/YOUTHCARD.png',
        '플래티넘 카드': '../../../images/product/PLATINUMCARD.png',
        '디지털 카드': '../../../images/product/DIGITALCARD.png',
        'SPIKE 카드': '../../../images/product/SPIKECARD.png',
        'SPIKE TRAVEL 카드': '../../../images/product/TRAVELCARD.png',
        '플러스 카드': '../../../images/product/PLUSCARD.png'
    };

    if (imageMap[selectedType]) {
        cardImage.src = imageMap[selectedType];
        title.textContent = selectedType + ' 발급';
    }
});

// 전역 변수 정의
const card_password = document.getElementById('card_password');
const confirmPassword = document.getElementById('confirmPassword');
const overseasPaymentField = document.getElementById('overseas_payment_value');
const transportationCardField = document.getElementById('transportation_card_value');

// 폼 제출 시 처리
document.getElementById('signupForm').addEventListener('submit', function(e) {
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
        
        // 알림창 표시
        alert(`카드발급을 축하드립니다.\n귀하의 카드번호는 ${newCardNumber} 입니다.`);
        
        this.submit(); // 폼 제출
    }
});

// 비밀번호 유효성 검사
function validateForm() {
    return validatePassword() && validatePasswordMatch();
}

function validatePassword() {
    const passwordRegex = /^[0-9]{6}$/;
    const isValid = passwordRegex.test(card_password.value);
    card_password.setCustomValidity(isValid ? '' : '비밀번호는 6자리 숫자여야 합니다.');
    return isValid;
}

function validatePasswordMatch() {
    const isValid = card_password.value === confirmPassword.value;
    confirmPassword.setCustomValidity(isValid ? '' : '비밀번호가 일치하지 않습니다.');
    return isValid;
}

// 카드번호 생성 함수
function generateCardNumber() {
    const numbers = Array.from({ length: 16 }, () => Math.floor(Math.random() * 10));
    return `${numbers.slice(0, 4).join('')}-${numbers.slice(4, 8).join('')}-${numbers.slice(8, 12).join('')}-${numbers.slice(12).join('')}`;
}