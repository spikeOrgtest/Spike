package com.spike.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spike.dto.QuizDTO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository // 이 클래스가 DAO 컴포넌트임을 나타내는 어노테이션
public class QuizDAOImpl implements QuizDAO {

    @PersistenceContext // JPA에서 데이터베이스와 상호작용하기 위한 EntityManager를 주입받습니다.
    private EntityManager entityManager; // EntityManager는 JPA에서 데이터베이스와 직접 연결되어 작업을 수행하는 객체입니다.

    @Override
    @Transactional // 트랜잭션을 명시적으로 관리합니다. 이 메소드가 실행되는 동안 데이터베이스 작업은 하나의 트랜잭션 내에서 처리됩니다.
    public void insertQuiz(QuizDTO quiz) {
        // persist 메소드를 통해 QuizDTO 객체를 데이터베이스에 삽입합니다.
        // entityManager.persist(quiz)는 전달된 quiz 객체의 데이터를 INSERT INTO 쿼리로 데이터베이스에 저장합니다.
        entityManager.persist(quiz); // QuizDTO 객체를 Quiz 테이블에 삽입
    }

    @Override
    public List<QuizDTO> getAllQuizzes() {
        // JPQL(Java Persistence Query Language)을 사용하여 모든 퀴즈를 조회합니다.
        // "FROM QuizDTO"는 QuizDTO 엔티티에 매핑된 모든 데이터를 조회하는 쿼리입니다.
        // getResultList()는 쿼리 결과를 List 형태로 반환합니다.
        return entityManager.createQuery("FROM QuizDTO", QuizDTO.class).getResultList(); 
    }

    @Override
    public QuizDTO getQuizById(int quizId) {
        // 특정 ID(quizId)를 기반으로 퀴즈를 조회합니다.
        // entityManager.find(QuizDTO.class, quizId)는 QuizDTO 엔티티 클래스와 quizId를 이용하여 해당 데이터를 조회합니다.
        // 만약 해당 ID를 가진 퀴즈가 없다면 null을 반환합니다.
        return entityManager.find(QuizDTO.class, quizId); // quizId에 해당하는 QuizDTO 객체 반환
    }

    @Override
    @Transactional // 이 메소드도 트랜잭션을 적용하여, 데이터베이스 작업을 하나의 트랜잭션으로 처리합니다.
    public void updateLastAttemptDate(int quizId) {
        // 먼저 quizId로 해당 퀴즈를 조회합니다.
        // find 메소드를 사용하여 퀴즈 엔티티를 조회합니다.
        QuizDTO quiz = getQuizById(quizId);
        
        // 만약 해당 퀴즈가 존재하면
        if (quiz != null) {
            // 현재 시간으로 last_attempt_date를 업데이트합니다. 
            // new java.sql.Timestamp(System.currentTimeMillis())는 현재 시간을 Timestamp 형식으로 생성합니다.
            quiz.setLast_attempt_date(new java.sql.Timestamp(System.currentTimeMillis())); // 현재 시간을 설정
            
            // entityManager.merge(quiz)는 수정된 quiz 객체를 데이터베이스에 반영합니다. 
            // 변경된 데이터를 저장하거나 업데이트하는 작업입니다.
            entityManager.merge(quiz); // 변경된 데이터를 DB에 반영
        }
    }

    @Override
    public int countUserQuizAttempts(int userId, String date) {
        // 이 메소드는 사용자가 특정 날짜에 푼 퀴즈의 개수를 카운트하는 로직입니다.
        // 현재는 예시로 0을 반환하는 코드만 작성되어 있습니다. 실제로는 DB에서 해당 조건을 만족하는 데이터를 조회하는 쿼리를 작성해야 합니다.
        return 0; // 예시로 0을 반환
    }
}
