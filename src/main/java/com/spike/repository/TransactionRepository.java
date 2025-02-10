package com.spike.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.TransactionDTO;

@Repository
public interface TransactionRepository extends JpaRepository<TransactionDTO, Long> {

	// 쿼리 메서드로 상위 5개 송금 기록을 반환, 쿼리메서드 동작하지 않아서 일단 JPQL 어노테이션 붙임 -> 쿼리메서드 길면 제대로 인식을 못 하는듯
	@Query("SELECT t FROM TransactionDTO t JOIN t.fromAccount a JOIN a.owner u WHERE u.userId = ?1 AND t.transactionDate >= ?2 ORDER BY t.transactionDate DESC")
	List<TransactionDTO> getRecentTransfers(Long userId, Timestamp startDate, Pageable pageable);

	@Query("SELECT t FROM TransactionDTO t WHERE t.fromAccount.id = ?1 OR t.toAccount.id = ?1 ORDER BY t.transactionDate DESC")
	List<TransactionDTO> getTransferHistoryByAccountId(Long accountId);

}
