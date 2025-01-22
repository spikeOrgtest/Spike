package com.spike.dao;

import com.spike.dto.QuizResultDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Repository // 이 클래스는 Repository 계층으로, DB 접근을 담당하는 클래스임을 나타냅니다.
public class QuizResultDAOImpl implements QuizResultDAO {

    @Autowired // EntityManager는 JPA를 통해 DB와 상호작용하는 객체입니다.
    private EntityManager entityManager;

    @Override
    @Transactional // 트랜잭션을 적용하여 DB에 대한 작업을 안전하게 처리합니다.
    public QuizResultDTO saveQuizResult(QuizResultDTO quizResultDTO) {
        // 퀴즈 결과를 DB에 저장
        entityManager.persist(quizResultDTO); // entityManager를 통해 데이터베이스에 엔티티를 저장합니다.
        return quizResultDTO; // 저장된 결과를 반환
    }

    @Override
    public List<QuizResultDTO> findByUserIdAndDate(int userId, String date) {
        // 특정 사용자의 퀴즈 결과를 날짜별로 조회하는 쿼리
        String query = "SELECT q FROM QuizResultDTO q WHERE q.user_id = :userId AND TO_CHAR(q.attempt_date, 'YYYY-MM-DD') = :date";
        return entityManager.createQuery(query, QuizResultDTO.class) // JPQL 쿼리 생성
                            .setParameter("userId", userId) // userId 파라미터 바인딩
                            .setParameter("date", date) // date 파라미터 바인딩
                            .getResultList(); // 결과를 반환
    }

    @Override
    public int countQuizAttemptsToday(int userId, String date) {
        // 오늘 날짜 기준으로 사용자가 시도한 퀴즈 횟수를 카운트하는 쿼리
        String query = "SELECT COUNT(q) FROM QuizResultDTO q WHERE q.user_id = :userId AND TO_CHAR(q.attempt_date, 'YYYY-MM-DD') = :date";
        Query countQuery = entityManager.createQuery(query); // 카운트 쿼리 생성
        countQuery.setParameter("userId", userId); // userId 파라미터 바인딩
        countQuery.setParameter("date", date); // date 파라미터 바인딩
        return ((Long) countQuery.getSingleResult()).intValue(); // 카운트된 결과를 반환
    }

    /**
     * 사용자가 특정 퀴즈를 푼 결과를 조회하는 메소드.
     * 
     * 이 메소드는 사용자 ID와 퀴즈 ID를 기준으로 사용자가 푼 특정 퀴즈의 결과를 반환합니다.
     * 
     * @param userId 사용자의 ID
     * @param quizId 퀴즈의 ID
     * @return 조회된 퀴즈 결과를 담은 `QuizResultDTO` 객체 (결과가 없으면 null 반환)
     */
    @Override
    public QuizResultDTO findQuizResultByUserIdAndQuizId(int userId, int quizId) {
        // 특정 퀴즈에 대한 사용자의 퀴즈 결과를 조회하는 JPQL 쿼리
        String query = "SELECT q FROM QuizResultDTO q WHERE q.user_id = :userId AND q.quiz_id = :quizId";
        
        // 결과 조회
        List<QuizResultDTO> resultList = entityManager.createQuery(query, QuizResultDTO.class)
                                                      .setParameter("userId", userId) // userId 파라미터 바인딩
                                                      .setParameter("quizId", quizId) // quizId 파라미터 바인딩
                                                      .getResultList(); // 결과 리스트 반환
        
        // 결과가 존재하면 첫 번째 항목 반환, 없으면 null 반환
        if (resultList.isEmpty()) {
            return null; // 결과가 없으면 null을 반환
        } else {
            return resultList.get(0); // 첫 번째 결과를 반환
        }
    }
}
