package com.spike.repository;

import com.spike.dto.PointHistoryDTO;
import com.spike.dto.UserDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PointHistoryRepository extends JpaRepository<PointHistoryDTO, Long> {

    // 특정 사용자의 최신 5개의 포인트 사용 내역 조회 (최신순)
    List<PointHistoryDTO> findTop5ByUserOrderByUseDateDesc(UserDTO user);

    // @Query를 이용하여 사용자 ID로 조회
    @Query("SELECT p FROM PointHistoryDTO p WHERE p.user.id = :userId ORDER BY p.useDate DESC")
    List<PointHistoryDTO> findByUserId(@Param("userId") Long userId);
}