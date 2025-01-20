package com.spike.dao;

import com.spike.dto.QuizResultDTO;
import com.spike.dto.UserDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface QuizResultRepository extends JpaRepository<QuizResultDTO, Integer> {

    // 특정 사용자 ID에 대한 퀴즈 결과 조회
    List<QuizResultDTO> findByUser(UserDTO user);

    
}
