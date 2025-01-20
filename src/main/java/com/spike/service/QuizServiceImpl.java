package com.spike.service;

import com.spike.dao.QuizRepository;
import com.spike.dto.QuizDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizServiceImpl implements QuizService {

    @Autowired
    private QuizRepository quizRepository;  // QuizRepository를 통해 DB에서 퀴즈 정보를 조회

    @Override
    public List<QuizDTO> getAllQuizzes() {
        return quizRepository.findAll();  // 모든 퀴즈 목록을 반환
    }

    @Override
    public QuizDTO getQuizById(int quizId) {
        return quizRepository.findById(quizId).orElseThrow(() -> new IllegalArgumentException("Quiz not found with id: " + quizId));
        // 퀴즈 ID로 퀴즈를 찾아 반환. 없으면 예외 처리.
    }

    @Override
    public boolean attemptQuiz(Long userId, int quizId, String userAnswer) {
        // 퀴즈 풀기 로직 구현 (이전에 설명한 대로)
        return true;
    }

    @Override
    public void saveQuizAttempt(int quizId, Long userId, boolean isCorrect) {
        // 퀴즈 시도 저장 로직 구현
    }

    @Override
    public boolean canAttemptQuizToday(Long userId) {
        // 하루에 푼 퀴즈 개수 체크 로직 구현
        return true;
    }

    @Override
    public boolean checkAnswer(int quizId, String userAnswer) {
        // 퀴즈의 정답 확인 로직 구현
        return true;
    }
}
