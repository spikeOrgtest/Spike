package com.spike.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spike.dto.QuizDTO;

@Service
public interface QuizService {
    List<QuizDTO> getAllQuizzes();  // 퀴즈 목록을 가져오는 메서드
    boolean attemptQuiz(int userId, int quizId, String userAnswer);  // 퀴즈 풀기
    void saveQuizAttempt(int quizId, int userId, boolean isCorrect);  // 퀴즈 시도 저장
    boolean canAttemptQuizToday(int userId);  // 하루에 푼 퀴즈 개수 체크
}
