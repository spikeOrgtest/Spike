<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증권 계좌 생성</title>
    <link href="/css/investment/open_securitiesaccount.css" rel="stylesheet">
    <script>
        // 비밀번호와 확인 비밀번호 검증
        function validatePassword() {
            const password = document.getElementById("accountPassword").value;
            const confirmPassword = document.getElementById("confirmAccountPassword").value;

            // 비밀번호가 6자리 숫자인지 확인
            const passwordRegex = /^\d{6}$/;
            if (!passwordRegex.test(password)) {
                alert("비밀번호는 6자리 숫자여야 합니다.");
                return false;
            }

            // 비밀번호와 확인 비밀번호가 일치하는지 확인
            if (password !== confirmPassword) {
                alert("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
                return false;
            }

            return true; // 모든 검증 통과 시 폼 제출
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>증권 계좌 생성</h1>
        <!-- 계좌 생성 폼 -->
        <form id="createAccountForm" action="/api/securities-account/securitiesaccount/open" method="post" enctype="multipart/form-data" onsubmit="return validatePassword();">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <!-- Spring Security CSRF 토큰 -->
            <sec:csrfInput />

            <!-- 로그인된 사용자 ID는 숨겨진 필드로 전송 -->
            <input type="hidden" id="userId" name="userId" value="${loggedInUserId}">

            <!-- 초기 입금액 -->
            <label for="initialDeposit">초기 입금액:</label>
            <input type="number" id="initialDeposit" name="initialDeposit" step="0.01" required>

            <!-- 화폐 단위 -->
            <label for="currency">화폐 단위:</label>
            <select id="currency" name="currency" required>
                <option value="KRW">KRW</option>
            </select>

            <!-- 계좌 비밀번호 -->
            <label for="accountPassword">계좌 비밀번호:</label>
            <input type="password" id="accountPassword" name="accountPassword" maxlength="6" required>

            <!-- 비밀번호 확인 -->
            <label for="confirmAccountPassword">비밀번호 확인:</label>
            <input type="password" id="confirmAccountPassword" maxlength="6" required>

            <!-- 제출 버튼 -->
            <button type="submit">계좌 생성</button>
        </form>
        <!-- 메시지 표시 -->
        <div id="message"></div>
    </div>
</body>
</html>
