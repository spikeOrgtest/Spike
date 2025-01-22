package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.TransactionDTO;
@Repository
public interface TransactionRepository extends JpaRepository<TransactionDTO, Long> {
	
}
