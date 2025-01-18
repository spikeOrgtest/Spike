package com.spike.dao;

import com.spike.dto.QuizDTO;
import java.util.List;

public interface QuizDAO {
    void insertQuiz(QuizDTO quiz); // 새로운 퀴즈 데이터를 데이터베이스에 저장하는 작업. 이 메소드가 호출되면, QuizDTO 객체에 담긴 퀴즈 정보가 데이터베이스의 Quiz 테이블에 저장
    List<QuizDTO> getAllQuizzes(); // 모든 퀴즈 조회
    QuizDTO getQuizById(int quizId); // ID로 퀴즈 조회
    void updateLastAttemptDate(int quizId); // 퀴즈 풀었을 때 마지막 시도 날짜 업데이트
    int countUserQuizAttempts(int userId, String date); // 하루에 푼 퀴즈 개수 체크
}