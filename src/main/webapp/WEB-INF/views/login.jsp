<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SPIKE! 번개처럼 빠른 송금</title>
<link rel="stylesheet" href="../css/include/include.css">
<link rel="stylesheet" href="../css/login.css">
</head>
<body class="subpage">
	<%@ include file="include/header.jsp"%>

	<div class="content">
		<div class="login-wrapper">
			<div class="login-container">
				<h2>로그인</h2>
				<form name="s" action="/spike.com/login" method="post" class="login-form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="input-group">
						<input type="text" name="login_id" id="login_id"
							placeholder="아이디를 입력하세요" required>
					</div>
					<div class="input-group">
						<input type="password" name="password" id="password"
							placeholder="비밀번호를 입력하세요" required>
					</div>
					<div class="login-options">
						<label class="remember-me"> 
						<input type="checkbox" name="remember" id="rememberMe"> <span>아이디 저장</span>
						</label>
						<div class="auth-links">
							<a href="javascript:void(0);" onclick="openWindow('findId')">아이디
								찾기</a> <span>|</span> <a href="javascript:void(0);"
								onclick="openWindow('findPwd')">비밀번호 찾기</a> <span>|</span> <a
								href="javascript:location='signup';">회원가입</a>
						</div>
					</div>
					<button type="submit" class="login-btn">로그인</button>
					<div class="social-login">
						<button type="button" class="kakao-btn">
							<img src="../images/kakao.png" alt="카카오 로그인">
						</button>
						<button type="button" class="google-btn">
							<img src="../images/google.png" alt="구글 로그인">
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="include/shortfooter.jsp"%>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			// 아이디 저장 기능
			const savedId = localStorage.getItem('savedId');
			if (savedId) {
				// localStorage에 저장된 아이디가 있다면 입력란에 자동으로 값 넣기
				document.getElementById('login_id').value = savedId;
				// "아이디 저장" 체크박스도 체크하기
				document.getElementById('rememberMe').checked = true;
			}

			document.querySelector('.login-form')
					.addEventListener(
							'submit',
							function(e) {
								// 로그인 시 아이디와 체크박스 상태를 가져오기
								const login_id = document
										.getElementById('login_id').value; // 로그인 아이디 값
								const rememberMe = document
										.getElementById('rememberMe').checked; // 체크박스 상태 (true or false)

								// "아이디 저장" 체크박스가 체크되어 있으면 localStorage에 아이디 저장
								if (rememberMe) {
									localStorage.setItem('savedId', login_id); // 입력된 아이디 값을 localStorage에 저장
								} else {
									localStorage.removeItem('savedId'); // 체크박스가 해제되면 localStorage에서 아이디 삭제
								}
							});
		});

		// 작은 창을 띄우는 JavaScript 함수
		function openWindow(url) {
			// window.open(url, windowName, options);
			window.open(url, "popupWindow",
					"width=600,height=400,scrollbars=yes,resizable=yes");
		}
	</script>
</body>
</html>