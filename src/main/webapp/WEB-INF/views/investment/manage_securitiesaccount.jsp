<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌 관리</title>
    <link rel="stylesheet" href="/css/investment/manage_securitiesaccount.css">
</head>
<body>
    <div class="container">
        <h1>📂 계좌 관리</h1>

        <!-- 내 계좌 정보 -->
        <section class="account-info">
            <h2>내 계좌정보</h2>
            <p><strong>계좌 번호:</strong> ${account.accountNumber}</p>
            <p><strong>개설일:</strong> ${account.createdDate}</p>
        </section>

        <!-- 내 계좌 관리 -->
        <section class="account-actions">
            <h2>내 계좌관리</h2>

            <!-- 계좌 비밀번호 변경 -->
            <form id="changePasswordForm" action="/api/securities-account/change-password" method="post">
                <label for="newPassword">새 비밀번호:</label>
                <input type="password" id="newPassword" name="newPassword" maxlength="6" required>
                <label for="confirmPassword">비밀번호 확인:</label>
                <input type="password" id="confirmPassword" maxlength="6" required>
                <button type="submit">비밀번호 변경</button>
            </form>

            <!-- 계좌 해지 -->
            <form id="deleteAccountForm" action="/api/securities-account/delete" method="post">
                <input type="hidden" name="accountId" value="${account.accountId}">
                <button type="submit" class="btn-delete">계좌 해지</button>
            </form>
        </section>

        <!-- 홈 버튼 -->
        <div class="button-group">
            <a href="/spike.com/stock/home" class="btn btn-home">🏠 홈으로</a>
        </div>
    </div>
</body>
</html>
