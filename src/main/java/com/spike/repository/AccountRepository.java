package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;

@Repository
public interface AccountRepository extends JpaRepository<AccountDTO, Long> {
}
