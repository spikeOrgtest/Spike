package com.spike.repository;

import com.spike.dto.SecuritiesAccountDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SecuritiesAccountRepository extends JpaRepository<SecuritiesAccountDTO, Long> {

    // 수정된 메서드
    List<SecuritiesAccountDTO> findByUser_UserId(Long userId);
}
