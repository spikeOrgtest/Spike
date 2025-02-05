<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌 생성 오류</title>
    <link rel="stylesheet" href="/css/investment/account_error.css">
</head>
<body class="error-page">
    <div class="container">
        <h1 class="error-header">❌ 계좌 생성 오류</h1>
        <p>${errorMessage}</p>
        <a href="/spike.com/stock/home" class="btn btn-home">🏠 홈으로</a>
    </div>
</body>
</html>