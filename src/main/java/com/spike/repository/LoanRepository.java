package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.CardDTO;
import com.spike.dto.LoanDTO;

@Repository
public interface LoanRepository extends JpaRepository<LoanDTO, Long> {
}
