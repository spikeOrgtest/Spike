package com.spike.repository;

import com.spike.dto.SecuritiesAccountDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SecuritiesAccountRepository extends JpaRepository<SecuritiesAccountDTO, Long> {

    // user_id로 계좌 조회
    List<SecuritiesAccountDTO> findByUserId(Long userId);
}
