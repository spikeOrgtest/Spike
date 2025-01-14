document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('signupForm');
    const password = document.getElementById('password');
    const confirmPassword = document.getElementById('confirmPassword');
    const accountInfo = document.getElementById('accountInfo');
    const accountNumberSpan = document.getElementById('accountNumber');

    form.addEventListener('submit', function(e) {
        e.preventDefault();
        if (validateForm()) {
            const newAccountNumber = generateAccountNumber();
            accountNumberSpan.textContent = newAccountNumber;
            accountInfo.classList.remove('hidden');

            const formData = new FormData(form);
            const accountType = document.getElementById('accountType').value;  // accountType 추가
            const balance = 0;  // 잔액 기본값 설정
            const userId = 1;  // 실제 사용자 ID 값으로 변경 필요
            const createdDate = new Date();

            // 계좌 정보를 JSON 형식으로 준비
            const accountData = {
                accountNumber: newAccountNumber,
                accountType: accountType,
                balance: balance,
                userId: userId,
                createdDate: createdDate
            };

            // fetch 요청 보내기 (JSON 형식)
            fetch('/products/newmember', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(accountData)
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('계좌가 성공적으로 개설되었습니다!');
                } else {
                    alert('계좌 개설에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('계좌 개설 중 오류가 발생했습니다.');
            });
        }
    });

    password.addEventListener('input', validatePassword);
    confirmPassword.addEventListener('input', validatePasswordMatch);

    function validateForm() {
        return validatePassword() && validatePasswordMatch() && validateSSN();
    }

    function validatePassword() {
        const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}$/;
        const isValid = passwordRegex.test(password.value);
        password.setCustomValidity(isValid ? '' : '비밀번호 요구사항을 충족하지 않습니다.');
        return isValid;
    }

    function validatePasswordMatch() {
        const isValid = password.value === confirmPassword.value;
        confirmPassword.setCustomValidity(isValid ? '' : '비밀번호가 일치하지 않습니다.');
        return isValid;
    }

    function validateSSN() {
        const ssnInput = document.getElementById('ssn');
        const ssnRegex = /^\d{6}-\d{7}$/;
        const isValid = ssnRegex.test(ssnInput.value);
        ssnInput.setCustomValidity(isValid ? '' : '올바른 주민등록번호 형식이 아닙니다.');
        return isValid;
    }

    function generateAccountNumber() {
        const numbers = Array.from({ length: 13 }, () => Math.floor(Math.random() * 10));
        return `${numbers.slice(0, 3).join('')}-${numbers.slice(3, 7).join('')}-${numbers.slice(7, 11).join('')}-${numbers.slice(11).join('')}`;
    }
});
