package com.spike.service;

public interface QuizService {
    boolean attemptQuiz(int userId, int quizId, String userAnswer);  // 퀴즈 풀기
    void saveQuizAttempt(int quizId, int userId, boolean isCorrect);  // 퀴즈 시도 저장
    boolean canAttemptQuizToday(int userId);  // 하루에 푼 퀴즈 개수 체크
}
