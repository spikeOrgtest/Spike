package com.spike.controller;

import com.spike.service.QuizService;  // QuizService를 가져옵니다. 이 서비스는 퀴즈 관련 비즈니스 로직을 처리합니다.
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

// Spring MVC에서 Controller 역할을 하는 클래스입니다. URL 경로에 대한 요청을 처리합니다.
@Controller
@RequestMapping("/mini") // '/mini' 경로에 대한 요청을 이 컨트롤러가 처리하도록 지정
public class QuizController {

    // QuizService를 자동으로 주입 받습니다. 서비스 로직을 호출하여 퀴즈 관련 처리를 담당합니다.
    @Autowired
    private QuizService quizService;

    // 퀴즈 페이지를 사용자에게 보여주는 메소드입니다.
    // 클라이언트가 '/mini/quiz' URL로 GET 요청을 보내면 호출됩니다.
    @GetMapping("/quiz")  // '/mini/quiz' 경로에 대한 GET 요청을 처리합니다.
    public String miniquiz() {
        // 퀴즈 페이지를 보여주는 뷰의 이름을 반환합니다.
        return "mini/miniSubpage_quiz";  // 퀴즈 페이지의 뷰 이름 반환
    }

    // 사용자가 퀴즈를 시도할 때 호출되는 메소드입니다.
    // 클라이언트가 '/mini/quiz/attempt' URL로 POST 요청을 보내면 호출됩니다.
    @PostMapping("/quiz/attempt")  // '/mini/quiz/attempt' 경로에 대한 POST 요청을 처리합니다.
    @ResponseBody  // JSON이나 텍스트 형식으로 응답을 반환할 때 사용
    public String attemptQuiz(@RequestParam int userId, @RequestParam int quizId, @RequestParam String userAnswer) {
        // 퀴즈 시도: userId는 사용자의 ID, quizId는 퀴즈의 ID, userAnswer는 사용자가 입력한 답을 나타냄
        // quizService.attemptQuiz(userId, quizId, userAnswer)을 호출하여 퀴즈 정답 여부를 확인
        boolean isCorrect = quizService.attemptQuiz(userId, quizId, userAnswer);

        // 정답 여부에 따라 응답 메시지를 다르게 반환합니다.
        if (isCorrect) {
            // 사용자가 정답을 맞혔다면
            return "정답입니다! 포인트가 적립되었습니다.";  // 정답을 맞췄을 때의 응답 메시지
        } else {
            // 사용자가 틀렸다면
            return "틀렸습니다. 다시 시도해주세요.";  // 틀렸을 때의 응답 메시지
        }
    }

    // 사용자가 오늘 퀴즈를 시도할 수 있는지 확인하는 메소드입니다.
    // 클라이언트가 '/mini/quiz/canAttempt' URL로 GET 요청을 보내면 호출됩니다.
    // '/mini/quiz/canAttempt' 경로에 대한 GET 요청을 처리
    
    @GetMapping("/quiz/canAttempt") //http://localhost:8070/mini/quiz/canAttempt?userId=1
    @ResponseBody  // JSON 또는 텍스트 응답을 반환하기 위해 사용
    public String canAttemptQuizToday(@RequestParam int userId) {
        // 사용자가 오늘 푼 퀴즈 개수를 확인하는 로직
        boolean canAttempt = quizService.canAttemptQuizToday(userId);

        // 사용자가 퀴즈를 풀 수 있는지 여부를 확인하고, 그에 맞는 응답 메시지를 반환
        if (canAttempt) {
            return "오늘 퀴즈를 풀 수 있습니다!";  // 오늘 퀴즈를 풀 수 있는 경우
        } else {
            return "오늘은 이미 5개 이상의 퀴즈를 푼 경우입니다.";  // 이미 5개 이상의 퀴즈를 푼 경우
        }
    }
}