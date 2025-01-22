<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>계좌 생성 완료</title>
</head>
<body>
    <h1>계좌 생성 성공</h1>
    <p>계좌 번호: ${account_number}</p>
    <p>계좌 유형: ${account_type}</p>
    <p>계좌 비밀번호: ${account_password}</p>
    <p>잔액: ${balance}</p>
    <a href="/spike.com/products/newmember">메인으로 돌아가기</a>
</body>
</html>
