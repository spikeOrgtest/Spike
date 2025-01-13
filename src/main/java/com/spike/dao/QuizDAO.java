package com.spike.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.QuizDTO;

@Repository
public interface QuizDAO  {
    // 필요한 쿼리 메소드 추가 가능
	void insertQuiz(QuizDTO Q);
	
	
}
