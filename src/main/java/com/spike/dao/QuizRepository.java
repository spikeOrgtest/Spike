package com.spike.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.QuizDTO;


public interface QuizRepository extends JpaRepository<QuizDTO, Integer> {
    // Quiz 엔티티에 대한 CRUD 작업을 자동으로 처리하는 Repository
}
