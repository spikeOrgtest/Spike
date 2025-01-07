<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPIKE - 회원가입</title>
    <link rel="stylesheet" href="assets/css/signup.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <h1>회원가입</h1>
                <p>SPIKE와 함께 시작하세요</p>
            </div>
            <form action="signupProcess.jsp" method="post" class="auth-form" id="signupForm">
                <div class="form-group">
                    <label for="userName">이름</label>
                    <input type="text" id="userName" name="userName" required placeholder="이름을 입력하세요">
                </div>
                <div class="form-group">
                    <label for="userEmail">이메일</label>
                    <input type="email" id="userEmail" name="userEmail" required placeholder="이메일을 입력하세요">
                    <span class="error-message" id="emailError"></span>
                </div>
                <div class="form-group">
                    <label for="userId">아이디</label>
                    <input type="text" id="userId" name="userId" required placeholder="아이디를 입력하세요">
                    <span class="error-message" id="idError"></span>
                </div>
                <div class="form-group">
                    <label for="userPassword">비밀번호</label>
                    <input type="password" id="userPassword" name="userPassword" required placeholder="비밀번호를 입력하세요">
                    <span class="error-message" id="passwordError"></span>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">비밀번호 확인</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="비밀번호를 다시 입력하세요">
                    <span class="error-message" id="confirmError"></span>
                </div>
                <button type="submit" class="btn btn-primary">가입하기</button>
                <div class="auth-links">
                    이미 계정이 있으신가요? <a href="login.jsp">로그인</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('signupForm').addEventListener('submit', function(e) {
            let isValid = true;
            
            // 이메일 검증
            const email = document.getElementById('userEmail').value;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').textContent = '올바른 이메일 형식이 아닙니다';
                isValid = false;
            } else {
                document.getElementById('emailError').textContent = '';
            }

            // 아이디 검증
            const id = document.getElementById('userId').value;
            const idRegex = /^[a-zA-Z0-9]{4,20}$/;
            if (!idRegex.test(id)) {
                document.getElementById('idError').textContent = '아이디는 4-20자의 영문, 숫자만 가능합니다';
                isValid = false;
            } else {
                document.getElementById('idError').textContent = '';
            }

            // 비밀번호 검증
            const password = document.getElementById('userPassword').value;
            if (password.length < 8) {
                document.getElementById('passwordError').textContent = '비밀번호는 8자 이상이어야 합니다';
                isValid = false;
            } else {
                document.getElementById('passwordError').textContent = '';
            }

            // 비밀번호 확인
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (password !== confirmPassword) {
                document.getElementById('confirmError').textContent = '비밀번호가 일치하지 않습니다';
                isValid = false;
            } else {
                document.getElementById('confirmError').textContent = '';
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>

