package com.spike.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.QuizRepository;
import com.spike.dto.QuizDTO;


@Service
public class QuizServiceImpl implements QuizService {

    @Autowired
    private QuizRepository quizRepository;  // QuizRepository를 주입받아 DB에서 퀴즈 목록을 가져옴

    @Override
    public List<QuizDTO> getAllQuizzes() {
        // QuizRepository에서 모든 퀴즈 데이터를 가져와서 QuizDTO로 변환
        return quizRepository.findAll().stream()
            .map(quiz -> new QuizDTO(quiz.getQuizId(), quiz.getQuestion(), quiz.getCorrectAnswer(), quiz.getPoints()))
            .collect(Collectors.toList());
    }

    @Override
    public boolean attemptQuiz(int userId, int quizId, String userAnswer) {
        // 퀴즈 풀기 로직 구현
        // 예시로만 둡니다. 실제 구현은 퀴즈 결과에 따라 로직을 작성하셔야 합니다.
        return false;
    }

    @Override
    public void saveQuizAttempt(int quizId, int userId, boolean isCorrect) {
        // 퀴즈 시도 결과를 DB에 저장하는 로직
    }

    @Override
    public boolean canAttemptQuizToday(int userId) {
        // 사용자가 오늘 푼 퀴즈 개수를 체크하는 로직
        return true;  // 예시로 항상 푼다고 설정
    }
}
