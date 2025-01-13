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
		<form action="/findPwd_ok" method="POST">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" id="id" name="id"
					required>
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input type="text" id="name"
					name="name" required>
			</div>
			<div class="form-group">
				<input type="submit" value="비밀번호 찾기">
			</div>
		</form>
	</div>
</body>
</html>