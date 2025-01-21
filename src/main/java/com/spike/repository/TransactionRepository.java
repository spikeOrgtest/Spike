package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.TransactionDTO;

public interface TransactionRepository extends JpaRepository<TransactionDTO, Long> {
	
}
