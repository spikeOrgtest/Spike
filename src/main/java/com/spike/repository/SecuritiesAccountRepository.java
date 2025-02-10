package com.spike.repository;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SecuritiesAccountRepository extends JpaRepository<SecuritiesAccountDTO, Long> {

	// UserDTO 객체 기반으로 계좌 조회
    Optional<SecuritiesAccountDTO> findByUser(UserDTO user);
  
    // userId로 계좌 조회 (ANSI JOIN 방식 적용)
    @Query("SELECT s FROM SecuritiesAccountDTO s JOIN FETCH s.user u WHERE u.userId = :userId")
    Optional<SecuritiesAccountDTO> findByUser_UserId(@Param("userId") Long userId);
    
}

