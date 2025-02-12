<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증권 계좌 출금</title>
    <link href="/css/investment/withdraw.css" rel="stylesheet">
    <script>
        function updateBalance() {
            const balanceDisplay = document.getElementById("balanceDisplay");
            const balance = parseInt("${securitiesAccount.balance}", 10) || 0;
            balanceDisplay.textContent = "잔액: " + balance.toLocaleString("ko-KR") + " 원";
        }

        function validateWithdraw() {
            const amount = document.getElementById("withdrawAmount").value;
            const balance = parseInt("${securitiesAccount.balance}", 10);

            if (!amount || amount <= 0) {
                alert("출금 금액을 입력하세요.");
                return false;
            }

            if (amount > balance) {
                alert("잔액이 부족합니다.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>증권 계좌 출금</h1>
        <form id="withdrawForm" action="/spike.com/securities-account/withdraw" method="post" onsubmit="return validateWithdraw();">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <sec:csrfInput />

            <!-- 고정된 증권 계좌 정보 -->
            <label>출금할 증권 계좌:</label>
            <input type="hidden" name="securitiesAccountNumber" value="${securitiesAccount.accountNumber}">
            <p>${securitiesAccount.accountNumber} (잔액: <fmt:formatNumber value="${securitiesAccount.balance}" type="number"/> 원)</p>

            <!-- 계좌 잔액 표시 -->
            <div id="balanceDisplay">잔액: - 원</div>

            <!-- 출금 금액 입력 -->
            <label for="withdrawAmount">출금 금액:</label>
            <input type="number" id="withdrawAmount" name="withdrawAmount" step="1000" min="1000" required>

            <!-- 입금할 일반 계좌 선택 -->
            <label for="destinationAccountSelect">입금할 일반 계좌:</label>
            <select id="destinationAccountSelect" name="destinationAccountNumber" required>
                <option value="">계좌를 선택하세요</option>
                <c:forEach var="account" items="${accList}">
                    <option value="${account.accountNumber}">
                        ${account.accountNumber} (잔액: <fmt:formatNumber value="${account.balance}" type="number"/> 원)
                    </option>
                </c:forEach>
            </select>

            <!-- 출금 비밀번호 -->
            <label for="accountPassword">증권 계좌 비밀번호:</label>
            <input type="password" id="accountPassword" name="accountPassword" maxlength="6" required>

            <!-- 제출 버튼 -->
            <button type="submit">출금 요청</button>

            <!-- 홈 버튼 -->
            <a href="/spike.com/stock/home" class="btn btn-home">🏠 홈으로</a>
        </form>
    </div>

    <script>
    window.onload = function() {
        var message = "${message}";
        if (message) {
            alert(message);
        }
        updateBalance(); // 페이지 로드 시 잔액 표시
    };
    </script>
</body>
</html>
