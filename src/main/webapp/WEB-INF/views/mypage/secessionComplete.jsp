<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>탈퇴 완료</title>
</head>
<body>
    <%-- 탈퇴 후 리다이렉트 처리 자바스크립트 --%>
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
    %>
        <script>
            alert('<%= message %>');
            window.location.href = '/spike.com';
        </script>
    <%
        }
    %>
</body>
</html>
