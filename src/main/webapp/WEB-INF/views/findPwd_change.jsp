<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 수정</title>
    <link rel="stylesheet" href="../css/findPwd_change.css">
</head>
<body>
    <form action="${pageContext.request.contextPath}/findPwd_change_ok" method="post">
    <h2>비밀번호 변경</h2>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <input type="hidden" name="login_id" value="${find_id}" />
        <input type="hidden" name="name" value="${find_name}" />
        
        <label for="newPassword">새 비밀번호</label>
        <input type="password" id="newPassword" name="newPassword" required />

        <label for="confirmPassword">비밀번호 확인</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required />

        <button type="submit">비밀번호 변경</button>
    </form>
</body>
</html>
