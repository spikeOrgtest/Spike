package com.spike.repository;

import com.spike.dto.QuizRank;
import com.spike.dto.QuizResultDTO;

import com.spike.dto.UserDTO;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface QuizResultRepository extends JpaRepository<QuizResultDTO, Integer> {


	List<QuizResultDTO> findByUser(UserDTO user);  

	// 마이 포인트 페이지 퀴즈 랭킹 조회 쿼리
	@Query(value = """
			SELECT name, correctAnswered, earnedPoints FROM (
			    SELECT u.user_id, u.name as name, COUNT(qr.answered_correctly) AS correctAnswered, SUM(qr.earned_points) AS earnedPoints
			    FROM quiz_result qr 
			    JOIN user_info u ON u.user_id = qr.user_id
			    WHERE qr.answered_correctly = 'Y'
			    GROUP BY u.user_id, u.name
			    ORDER BY correctAnswered DESC
			)
			WHERE ROWNUM <= 3
			""", nativeQuery = true)
	List<QuizRank> findTop3();
	
}


