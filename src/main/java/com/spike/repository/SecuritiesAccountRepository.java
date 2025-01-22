package com.spike.repository;

import com.spike.dto.SecuritiesAccountDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SecuritiesAccountRepository extends JpaRepository<SecuritiesAccountDTO, Long> {

    // 특정 사용자 ID로 계좌 목록 검색
    List<SecuritiesAccountDTO> findByUserId(Long userId);
}
