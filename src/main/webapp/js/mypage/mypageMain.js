document.getElementById("editProfileForm").addEventListener('submit', function(e) {
	
	let isValid = true;

        // 모든 오류 메시지 초기화
        document.getElementById('currentpasswordError').textContent = '';
        document.getElementById('passwordError').textContent = '';
        document.getElementById('password2Error').textContent = '';

        // 현재 비밀번호 유효성 검사
            const currentPassword = document.getElementById('currentPassword').value;
            if (currentPassword === '') {
                document.getElementById('currentpasswordError').textContent = '비밀번호를 입력해주세요';
                document.getElementById('currentPassword').focus();
                isValid = false;
            } else if (currentPassword.length < 8) {
                document.getElementById('currentpasswordError').textContent = '비밀번호는 8자 이상이어야 합니다';
                document.getElementById('currentPassword').focus();
                isValid = false;
            }

        // 새 비밀번호 유효성 검사
        if (isValid) {
            const password = document.getElementById('password').value;
			const currentPassword = document.getElementById('currentPassword').value;
            if (password === '') {
                document.getElementById('passwordError').textContent = '비밀번호를 입력해주세요';
                document.getElementById('password').focus();
                isValid = false;
            } else if (password.length < 8) {
                document.getElementById('passwordError').textContent = '비밀번호는 8자 이상이어야 합니다';
                document.getElementById('password').focus();
                isValid = false;
            } else if (password === currentPassword) {
				document.getElementById('passwordError').textContent = '현재 비밀번호와 일치합니다.';
				document.getElementById('password').focus();
				isValid = false;
			}
        }

        // 비밀번호 확인 유효성 검사
        if (isValid) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('password2').value;
            if (password !== confirmPassword) {
                document.getElementById('password2Error').textContent = '새 비밀번호와 일치하지 않습니다';
                document.getElementById('password2').focus();
                isValid = false;
            }
        }

        // 유효성 검사가 실패하면 폼 제출 방지
        if (!isValid) {
            e.preventDefault(); // 이 부분이 폼 제출을 막는 부분입니다.
        }
    });

document.getElementById('cancelButton').addEventListener('click', function() {
  // 모달을 닫는 방법
  $('#withdrawalModal').modal('hide');
});