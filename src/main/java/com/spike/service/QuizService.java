package com.spike.service;

import com.spike.dao.QuizDAO;
import com.spike.model.Quiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuizService {

    @Autowired
    private QuizDAO quizDAO;

    // 퀴즈 추가
    public Quiz addQuiz(Quiz quiz) {
        return quizDAO.save(quiz);
    }

    // 퀴즈 ID로 조회
    public Optional<Quiz> getQuizById(Long quizId) {
        return quizDAO.findById(quizId);
    }

    // 모든 퀴즈 조회
    public List<Quiz> getAllQuizzes() {
        return quizDAO.findAll();
    }

    // 퀴즈 삭제
    public void deleteQuiz(Long quizId) {
        quizDAO.deleteById(quizId);
    }
}
