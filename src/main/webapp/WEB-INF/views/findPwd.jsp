<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../css/findPwd.css">
</head>
<body>
	<div class="container">
		<h2>비밀번호 찾기</h2>
		<form action="findPwd_ok" method="POST" id="findPasswordForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" id="id" name="id">
			<span class="error-message" id="idError" style="color:red;"></span>
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name">
			<span class="error-message" id="nameError" style="color:red;"></span>
			</div>
			<div class="form-group">
				<input type="submit" value="비밀번호 찾기">
			</div>
		</form>
	</div>
</body>
<script>
document.getElementById('findPasswordForm').addEventListener('submit', function(e) {
    let isValid = true;


    document.getElementById('nameError').textContent = '';
    document.getElementById('idError').textContent = '';

    // 아이디 필드 검증
    const id = document.getElementById('id').value;
    if (id === '') {
        document.getElementById('idError').textContent = '아이디를 입력해주세요';
        document.getElementById('id').focus();
        isValid = false;
    }

    // 이름 필드 검증
    if (isValid) {
        const name = document.getElementById('name').value;

        if (name === '') {
            document.getElementById('nameError').textContent = '이름을 입력해주세요';
            document.getElementById('name').focus();
            isValid = false;
        }
    }


    if (!isValid) {
        e.preventDefault();
    }
});
</script>
</html>