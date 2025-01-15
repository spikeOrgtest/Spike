document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('signupForm');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');
    const accountInfo = document.getElementById('accountInfo');
    const accountNumberSpan = document.getElementById('accountNumber');

    form.addEventListener('submit', function(e) {
        e.preventDefault();  // 폼 제출을 막고, 우리가 직접 데이터를 처리하도록 함

        // 폼 유효성 검증
        if (validateForm()) {
            // 새로운 계좌 번호를 생성
            const newAccountNumber = generateAccountNumber();
            accountNumberSpan.textContent = newAccountNumber;
            accountInfo.classList.remove('hidden');  // 계좌 개설 성공 메시지 표시

            // 폼 데이터 수집
            const formData = new FormData(form);

            // 서버로 전송할 데이터 생성
            const accountData = {
                password: formData.get('password'),
                accountNumber: newAccountNumber,
                accountType: formData.get('accountType') || 'basic',  // 기본 계좌 유형
                balance: 0,  // 초기 잔액 설정
                userId: 1,  // 실제 사용자 ID로 변경 필요
                createdDate: new Date().toISOString()
            };

            // fetch를 사용하여 서버로 JSON 데이터 전송
            fetch('/products/newmember', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(accountData)  // JSON으로 변환하여 보내기
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('계좌가 성공적으로 개설되었습니다!');
                } else {
                    alert('계좌 개설에 실패했습니다. 다시 시도해주세요.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('계좌 개설 중 오류가 발생했습니다.');
            });
        }
    });

    // 비밀번호 확인 및 비밀번호 요구 사항 유효성 검증
    password.addEventListener('input', validatePassword);
    confirmPassword.addEventListener('input', validatePasswordMatch);

    function validateForm() {
        return validatePassword() && validatePasswordMatch();
    }

    function validatePassword() {
        const passwordRegex = /^[0-9]{6}$/;
        const isValid = passwordRegex.test(password.value);
        password.setCustomValidity(isValid ? '' : '비밀번호 요구사항을 충족하지 않습니다.');
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
