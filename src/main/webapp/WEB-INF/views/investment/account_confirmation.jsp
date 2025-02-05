<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌 확인</title>
    <link rel="stylesheet" href="/css/investment/account_confirmation.css">
</head>
<body class="confirmation-page">
    <div class="container">
        <h1 class="success-header">🎉 축하합니다! 계좌가 성공적으로 생성되었습니다! 🎉</h1>

        <!-- 계좌 정보 표시 -->
        <div class="account-info">
            <p><strong>계좌 번호:</strong> ${account.accountNumber}</p>
            <p><strong>초기 잔액:</strong> ${account.balance} ${account.currency}</p>
            <p><strong>화폐 단위:</strong> ${account.currency}</p>
        </div>

        <!-- 버튼 영역 -->
        <div class="button-group">
            <!-- 홈으로 돌아가는 버튼 -->
            <a href="/spike.com/stock/home" class="btn btn-home">🏠 주식 시장 홈으로</a>
        </div>
    </div>
</body>
</html>
