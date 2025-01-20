package com.spike.service;

import com.spike.dto.QuizDTO;

import java.util.List;

public interface QuizService {

    List<QuizDTO> getAllQuizzes();  // 퀴즈 목록을 가져오는 메서드
    QuizDTO getQuizById(int quizId);  // 퀴즈 ID로 퀴즈 정보를 가져오는 메서드
    boolean attemptQuiz(Long userId, int quizId, String userAnswer);  // 퀴즈 풀기
    void saveQuizAttempt(int quizId, Long userId, boolean isCorrect);  // 퀴즈 시도 저장
    boolean canAttemptQuizToday(Long userId);  // 하루에 푼 퀴즈 개수 체크
    boolean checkAnswer(int quizId, String userAnswer);  // 정답 확인
}
