package com.spike.service;

import com.spike.dao.QuizDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuizService {

    @Autowired
    private QuizDAO quizDAO;

   
/*
    // 퀴즈 ID로 조회
    public Optional<Quiz> getQuizById(Long quizId) {
        return quizDAO.findById(quizId);
    }

    
    // 모든 퀴즈 조회
    public List<Quiz> getAllQuizzes() {
        return quizDAO.findAll();
    }
*/
    
}
