package com.spike.dao;

import com.spike.model.Quiz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface QuizDAO extends JpaRepository<Quiz, Long> {
    // 필요한 쿼리 메소드 추가 가능
}
