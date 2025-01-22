<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>증권 계좌 조회</title>
    <link href="/css/investment/view_accounts.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1>증권 계좌 조회</h1>
        <!-- 계좌 조회 폼 -->
        <form id="viewAccountsForm">
            <label for="userId">사용자 ID:</label>
            <input type="number" id="userId" name="userId" required>
            <button type="submit">계좌 조회</button>
        </form>
        <!-- 계좌 목록 표시 -->
        <div id="accounts"></div>
    </div>

    <script>
        document.getElementById('viewAccountsForm').addEventListener('submit', async function (event) {
            event.preventDefault();

            // 사용자 ID 가져오기
            const userId = document.getElementById('userId').value;

            // API 호출
            const response = await fetch(`/api/securities-account/user/${userId}`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                },
            });

            const accounts = await response.json();

            // 계좌 목록 표시
            if (response.ok) {
                const accountsDiv = document.getElementById('accounts');
                accountsDiv.innerHTML = '<h2>계좌 목록</h2>';
                accountsDiv.innerHTML += `<ul>${accounts.map(account => `
                    <li>
                        <strong>계좌 번호:</strong> ${account.accountNumber}<br>
                        <strong>잔액:</strong> ${account.balance} KRW<br>
                        <strong>상태:</strong> ${account.status}
                    </li>
                `).join('')}</ul>`;
            } else {
                document.getElementById('accounts').innerText = `오류: ${accounts.message}`;
            }
        });
    </script>
</body>
</html>
