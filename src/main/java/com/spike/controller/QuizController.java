package com.spike.controller;

import com.spike.service.QuizResultService; // 퀴즈 결과 관련 비즈니스 로직을 처리하는 서비스
import com.spike.dto.QuizResultDTO; // 퀴즈 결과를 저장할 데이터 전송 객체 (DTO)
import com.spike.dto.UserDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.util.Date; // 날짜와 시간을 다루기 위한 클래스

@Controller // 이 클래스는 Spring MVC의 Controller 역할을 하며, HTTP 요청을 처리합니다.
@RequestMapping("/spike.com") // '/mini' 경로에 대한 요청을 처리하도록 설정
public class QuizController {

    @Autowired
    private QuizResultService quizResultService; // 퀴즈 결과를 처리하는 서비스 주입

    // 퀴즈 페이지를 사용자에게 보여주는 메소드
    @GetMapping("/quiz")  // '/mini/quiz' 경로에 대한 GET 요청을 처리
    public String miniquiz() {
        // 사용자에게 보여줄 퀴즈 페이지의 뷰 이름을 반환 (여기서는 Thymeleaf 템플릿을 사용한 예시)
        return "mini/miniSubpage_quiz";  
    }

    // 사용자가 퀴즈를 시도할 때 호출되는 메소드
    @PostMapping("/quiz/attempt")  // '/mini/quiz/attempt' 경로에 대한 POST 요청을 처리
    @ResponseBody  // JSON이나 텍스트 형식으로 응답을 반환하기 위한 어노테이션
    public String attemptQuiz(@RequestParam int userId, @RequestParam int quizId, @RequestParam String userAnswer, UserDTO u) {
        /*
            사용자가 퀴즈를 시도할 때 호출되는 메서드
            userId: 사용자의 ID
            quizId: 퀴즈의 ID
            userAnswer: 사용자가 입력한 답
        */

        // 퀴즈 시도 결과를 판단 (정답 여부)
        boolean isCorrect = quizResultService.attemptQuiz(userId, quizId, userAnswer); // QuizResultService의 메소드 호출

     // 퀴즈 결과를 DTO 객체에 저장
        QuizResultDTO quizResult = new QuizResultDTO();
        u.getUser_id(); // 사용자 ID 설정
        quizResult.setQuiz_id(quizId); // 퀴즈 ID 설정
        quizResult.setAnswered_correctly(isCorrect ? 'Y' : 'N'); // 정답 여부 설정
        quizResult.setEarned_points(isCorrect ? 10 : 0); // 정답이면 10포인트 적립, 틀리면 0포인트
        quizResult.setAttempt_date(new Date()); // 현재 시간 설정 (퀴즈 시도 시간)


        // 퀴즈 결과를 서비스 메소드를 통해 DB에 저장
        quizResultService.saveQuizResult(quizResult); 

        // 정답 여부에 따라 적절한 메시지 반환
        if (isCorrect) {
            return "정답입니다! 포인트가 적립되었습니다.";  // 정답 시 메시지
        } else {
            return "틀렸습니다. 다시 시도해주세요.";  // 오답 시 메시지
        }
    }

    // 사용자가 오늘 퀴즈를 시도할 수 있는지 확인하는 메소드
    @GetMapping("/quiz/canAttempt") // http://localhost:8070/mini/quiz/canAttempt?userId=1
    @ResponseBody  // JSON이나 텍스트 응답을 반환하기 위한 어노테이션
    public String canAttemptQuizToday(@RequestParam int userId) {
        /*
            사용자가 오늘 퀴즈를 시도할 수 있는지 여부를 확인하는 메소드
            userId: 사용자의 ID
        */

        // 사용자가 오늘 퀴즈를 시도할 수 있는지 여부 확인
        boolean canAttempt = quizResultService.canAttemptQuizToday(userId); // QuizResultService의 메소드 호출

        // 사용자가 퀴즈를 풀 수 있는지 여부에 따라 응답 메시지 반환
        if (canAttempt) {
            return "오늘 퀴즈를 풀 수 있습니다!";  // 오늘 퀴즈를 풀 수 있는 경우
        } else {
            return "오늘은 이미 5개 이상의 퀴즈를 푼 경우입니다.";  // 이미 5개 이상 푼 경우
        }
    }
    
    

    // 사용자가 푼 퀴즈 결과를 조회하는 메소드
    @GetMapping("/quiz/result") // /mini/quiz/result?userId=1&quizId=2
    @ResponseBody  // JSON이나 텍스트 응답을 반환하기 위한 어노테이션
    public QuizResultDTO getQuizResult(@RequestParam int userId, @RequestParam int quizId) {
        /*
            사용자가 푼 퀴즈의 결과를 조회하는 메소드
            userId: 사용자의 ID
            quizId: 퀴즈의 ID
        */

        // 퀴즈 결과를 QuizResultService에서 조회
        QuizResultDTO result = quizResultService.getQuizResult(userId, quizId);

        // 조회된 퀴즈 결과 반환
        return result;
    }
    
    //test
    @GetMapping("/test/attemptQuiz")  // '/spike.com/test/attemptQuiz' 경로로 GET 요청
    @ResponseBody
    public String testAttemptQuiz(UserDTO u) {
    	u.getUser_id();
        int userId = 1;  // 'qwer' 사용자 ID
        int quizId = 1;  // 첫 번째 퀴즈
        String userAnswer = "O";  // 정답을 맞췄다고 가정

        // 퀴즈 시도
        String resultMessage = attemptQuiz(userId, quizId, userAnswer, u);

        // 결과 반환
        return resultMessage;  // 정답 여부 메시지 반환
    }
    
    //퀴즈 포인트샵
    @GetMapping("/shop")  
    public String minishop() {
        // 사용자에게 보여줄 퀴즈 페이지의 뷰 이름을 반환 (여기서는 Thymeleaf 템플릿을 사용한 예시)
        return "mini/miniSubpage_quiz_shop";  
    }

    

}
    
    

