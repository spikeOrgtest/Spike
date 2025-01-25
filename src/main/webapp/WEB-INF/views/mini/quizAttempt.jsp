
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Attempt</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 사용 -->
</head>
<body>
    <h1>퀴즈 시도 가능 여부 확인</h1>
    
    <!-- 퀴즈 시도 가능 여부를 표시할 공간 -->
    <button id="checkQuizButton">오늘 퀴즈를 풀 수 있나요?</button>
    <p id="quizAttemptMessage"></p> <!-- 메시지가 이곳에 표시됩니다. -->

    <script>
        // 버튼 클릭 시 AJAX 요청 보내기
        $("#checkQuizButton").click(function() {
            // 사용자 ID (예시: 1번 사용자)
            var userId = 1;  // 실제로는 로그인한 사용자의 ID로 설정해야 합니다.

            $.ajax({
                url: '/mini/quiz/canAttempt',  // 요청할 URL
                type: 'GET',  // GET 방식으로 요청
                data: { userId: userId },  // userId를 요청 파라미터로 전달
                success: function(response) {
                    // 응답이 성공적이면 메시지를 표시
                    $("#quizAttemptMessage").text(response);
                },
                error: function() {
                    // 에러 발생 시 메시지 표시
                    $("#quizAttemptMessage").text("퀴즈 시도 여부 확인에 실패했습니다.");
                }
            });
        });
    </script>
</body>
</html>
