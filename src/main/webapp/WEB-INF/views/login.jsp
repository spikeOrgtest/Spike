<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SPIKE! 번개처럼 빠른 송금</title>
    <link rel="stylesheet" href="assets/css/include.css">
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body class="subpage">
   <%@ include file="include/header.jsp"%>

    <div class="content">
        <div class="login-wrapper">
            <div class="login-container">
                <h2>로그인</h2>
                <form action="loginProcess.jsp" method="post" class="login-form">
                    <div class="input-group">
                        <input type="text" name="userId" placeholder="아이디를 입력하세요" required>
                    </div>
                    <div class="input-group">
                        <input type="password" name="userPw" placeholder="비밀번호를 입력하세요" required>
                    </div>
                    <div class="login-options">
                        <label class="remember-me">
                            <input type="checkbox" name="remember">
                            <span>아이디 저장</span>
                        </label>
                        <div class="auth-links">
                            <a href="findId.jsp">아이디 찾기</a>
                            <span>|</span>
                            <a href="findPw.jsp">비밀번호 찾기</a>
                            <span>|</span>
                            <a href="signup.jsp">회원가입</a>
                        </div>
                    </div>
                    <button type="submit" class="login-btn">로그인</button>
                    <div class="social-login">
                        <button type="button" class="kakao-btn">
                            <img src="assets/img/kakao.png" alt="카카오 로그인">
                        </button>
                        <button type="button" class="google-btn">
                            <img src="assets/img/google.png" alt="구글 로그인">
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
                document.querySelector('input[name="userId"]').value = savedId;
                document.querySelector('input[name="remember"]').checked = true;
            }

            document.querySelector('.login-form').addEventListener('submit', function(e) {
                const rememberMe = document.querySelector('input[name="remember"]').checked;
                const userId = document.querySelector('input[name="userId"]').value;
                
                if (rememberMe) {
                    localStorage.setItem('savedId', userId);
                } else {
                    localStorage.removeItem('savedId');
                }
            });
        });
    </script>
</body>
</html>