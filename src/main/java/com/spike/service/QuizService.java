package com.spike.service;

import java.util.List;

import com.spike.dto.QuizDTO;

public interface QuizService {
	List<QuizDTO> getAllQuizzes();
    boolean attemptQuiz(int userId, int quizId, String userAnswer);  // 퀴즈 풀기
    void saveQuizAttempt(int quizId, int userId, boolean isCorrect);  // 퀴즈 시도 저장
    boolean canAttemptQuizToday(int userId);  // 하루에 푼 퀴즈 개수 체크
}
