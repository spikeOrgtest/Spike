<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link rel="stylesheet" href="../css/findPwd_change.css">
</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}findPwd_change_ok"
			method="post" id="passwordform">
			<h2>비밀번호 변경</h2>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="login_id"
				value="${find_id}" /> <input type="hidden" name="name"
				value="${find_name}" /> <label for="newPassword">새 비밀번호</label> <input
				type="password" id="newPassword" name="newPassword" required /> <span
				class="error-message" id="passwordError1"></span> <label
				for="confirmPassword">비밀번호 확인</label> <input type="password"
				id="confirmPassword" name="confirmPassword" required /> <span
				class="error-message" id="passwordError2"></span>

			<button type="submit">비밀번호 변경</button>
		</form>
	</div>
	<script>
	document
	.getElementById('passwordform')
	.addEventListener(
			'submit',
    	function(e) {
    		let isValid = true;
    		
			document.getElementById('passwordError1').textContent = '';
			document.getElementById('passwordError2').textContent = '';
    		
			// 비밀번호 검증
			const password = document
					.getElementById('newPassword').value;
			if (password.length < 8) {
				document.getElementById('passwordError1').textContent = '비밀번호는 8자 이상이어야 합니다';
				isValid = false;
			}

			// 비밀번호 확인 검증
			const confirmPassword = document
					.getElementById('confirmPassword').value;
			if (password !== confirmPassword) {
				document.getElementById('passwordError2').textContent = '비밀번호가 일치하지 않습니다';
				isValid = false;
			}
			
			if (!isValid) {
				e.preventDefault();
			}
    	}
    	);
    </script>
</body>
</html>
