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
            <label for="userId">사용자 ID:</label>
            <input type="number" id="userId" name="userId" required>

            <label for="accountNumber">계좌 번호:</label>
            <input type="text" id="accountNumber" name="accountNumber" required>

            <label for="initialDeposit">초기 입금액:</label>
            <input type="number" id="initialDeposit" name="initialDeposit" step="0.01" required>

            <label for="currency">화폐 단위:</label>
            <select id="currency" name="currency" required>
                <option value="KRW">KRW</option>
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
            const accountNumber = document.getElementById('accountNumber').value;
            const initialDeposit = document.getElementById('initialDeposit').value;
            const currency = document.getElementById('currency').value;

            // API 호출
            const response = await fetch('/api/securities-account', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    userId,
                    accountNumber,
                    initialDeposit,
                    currency,
                }),
            });

            const result = await response.json();

            // 결과 메시지 처리
            if (response.ok) {
                document.getElementById('message').innerText = '계좌가 성공적으로 생성되었습니다!';
            } else {
                document.getElementById('message').innerText = `오류: ${result.message}`;
            }
        });
    </script>
</body>
</html>
