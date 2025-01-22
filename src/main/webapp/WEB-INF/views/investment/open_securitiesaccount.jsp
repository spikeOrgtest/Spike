<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증권 계좌 생성</title>
    <link href="/css/investment/open_securitiesaccount.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>증권 계좌 생성</h1>
        <!-- 계좌 생성 폼 -->
        <form id="createAccountForm">
            <!-- 로그인된 사용자 ID는 숨겨진 필드로 전송 -->
            <input type="hidden" id="userId" name="userId" value="${loggedInUserId}">

            <label for="initialDeposit">초기 입금액:</label>
            <input type="number" id="initialDeposit" name="initialDeposit" step="0.01" required>

            <label for="currency">화폐 단위:</label>
            <select id="currency" name="currency" required>
                <option value="KRW">KRW</option>
                <option value="USD">USD</option>
            </select>

            <button type="submit">계좌 생성</button>
        </form>
        <!-- 메시지 표시 -->
        <div id="message"></div>
    </div>

    <script>
        document.getElementById('createAccountForm').addEventListener('submit', async function (event) {
            event.preventDefault();

            // 폼 데이터 가져오기
            const userId = document.getElementById('userId').value;
            const initialDeposit = document.getElementById('initialDeposit').value;
            const currency = document.getElementById('currency').value;

            // API 호출
            const response = await fetch('/api/securities-account', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    userId, // 로그인된 사용자 ID
                    initialDeposit,
                    currency
                }),
            });

            const result = await response.json();

            // 결과 메시지 처리
            if (response.ok) {
                document.getElementById('message').innerText = `계좌가 성공적으로 생성되었습니다! 계좌 번호: ${result.accountNumber}`;
            } else {
                document.getElementById('message').innerText = `오류: ${result.message}`;
            }
        });
    </script>
</body>
</html>
