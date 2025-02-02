package com.spike.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.TransactionDTO;
@Repository
public interface TransactionRepository extends JpaRepository<TransactionDTO, Long> {

	//쿼리 메서드로 상위 5개 송금 기록을 반환, 쿼리메서드 동작하지 않아서 일단 JPQL 어노테이션 붙임
	@Query("SELECT t FROM TransactionDTO t JOIN t.fromAccount a JOIN a.owner u WHERE u.user_id = ?1 ORDER BY t.transactionDate DESC")
	List<TransactionDTO> findTop5ByFromAccount_Owner_UserIdOrderByTransactionDateDesc(Long userId, Pageable pageable);
	
}
