<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증권 계좌 생성</title>
    <link href="/css/investment/open_securitiesaccount.css" rel="stylesheet">
    <script>
 // 계좌 선택 시 잔액 표시
    	function updateBalance() {
        	const selectedAccount = document.getElementById("accountSelect");
        	const balanceDisplay = document.getElementById("balanceDisplay");
        	const accountNumberInput = document.getElementById("selectedAccountNumber");

        	const selectedOption = selectedAccount.options[selectedAccount.selectedIndex];
        	const balance = parseInt(selectedOption.getAttribute("data-balance"), 10);
        	const accountNumber = selectedOption.value;
        	
        	balanceDisplay.textContent = "잔액: "+balance+" 원";
        	accountNumberInput.value = accountNumber;
   		 }    
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
        <form id="createAccountForm" action="/spike.com/securities-account/open" method="post" enctype="multipart/form-data" onsubmit="return validatePassword();">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <!-- Spring Security CSRF 토큰 -->
            <sec:csrfInput />

            <!-- 로그인된 사용자 ID는 숨겨진 필드로 전송 -->
            <input type="hidden" id="userId" name="userId" value="${loggedInUserId}">

			<!-- 기존 계좌 선택 -->
            <label for="accountSelect">이체할 계좌 선택:</label>
            <select id="accountSelect" name="sourceAccountId" onchange="updateBalance()" required>
                <option value="">계좌를 선택하세요</option>
                <c:forEach var="account" items="${accList}">
                    <option value="${account.accountNumber}" data-balance="${account.balance}">
                        ${account.accountNumber} (잔액: <fmt:formatNumber value="${account.balance}" type="number"/> 원) <%--  --%>
                    </option>
                </c:forEach>
            </select>

            <!-- 계좌 잔액 표시 -->
            <div id="balanceDisplay">잔액: - 원</div>

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
			<%-- 선택한 계좌의 계좌번호 hidden input으로 전송(컨트롤러 메서드의 매개변수로 전달됨, name= "" 이 이름으로 매개변수를 지정해야 바인딩 됨, 노션 참고) --%>
			<input type="hidden" id="selectedAccountNumber" name="selectedAccountNumber">
            <!-- 제출 버튼 -->
            <button type="submit">계좌 생성</button>
            
            <!-- 홈 버튼 -->
            <a href="/spike.com/stock/home" class="btn btn-home">🏠 홈으로</a>
        </form>
        <!-- 메시지 표시 -->
        <div id="message"></div>
    </div>
    
    <script>
    window.onload = function() {
        var message = "${message}";
        if (message) {
            alert(message);
        }
    };
</script>
    
</body>
</html>
