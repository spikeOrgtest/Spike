<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Attempt</title>
</head>
<body>
    <h1>퀴즈 시도 가능 여부 확인</h1>

    <!-- 사용자 ID를 입력하지 않도록, 이미 서버 측에서 설정된 값이나 로그인한 사용자의 ID를 보내도록 처리 -->
    <form action="/mini/quiz/canAttempt" method="get">
        <input type="hidden" name="userId" value="1">  <!-- 실제로는 로그인한 사용자의 ID를 동적으로 넣어야 합니다. -->
        <button type="submit">오늘 퀴즈를 풀 수 있나요?</button>
    </form>

    <!-- 서버에서 응답을 반환한 후, 페이지가 새로고침되며 결과 메시지를 확인할 수 있습니다. -->
</body>
</html>