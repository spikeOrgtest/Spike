package com.spike.dao;

import com.spike.dto.QuizResultDTO;
import java.util.List;

public interface QuizResultDAO {

    // 퀴즈 결과를 저장하는 메서드
    QuizResultDTO saveQuizResult(QuizResultDTO quizResultDTO);
    
    // 특정 사용자와 날짜에 대해 퀴즈 결과를 조회하는 메서드
    List<QuizResultDTO> findByUserIdAndDate(int userId, String date);

    // 특정 사용자와 날짜에 대해 오늘 퀴즈 시도 횟수를 카운트하는 메서드
    int countQuizAttemptsToday(int userId, String date);

	QuizResultDTO findQuizResultByUserIdAndQuizId(int userId, int quizId);
}
