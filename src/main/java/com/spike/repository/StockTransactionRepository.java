package com.spike.repository;

import com.spike.dto.StockTransaction;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockTransactionRepository extends JpaRepository<StockTransaction, Integer> {

	//  특정 주식의 가장 최근 거래 가격을 가져오는 쿼리 (최신 1개만 반환)
	@Query("SELECT st.price FROM StockTransaction st WHERE st.stock.stockId = :stockId ORDER BY st.transactionTime DESC")
	List<Long> findLatestTransactionPrices(@Param("stockId") int stockId);

	// 판매, 구매 내역으로 거래 내역 조회 (JPQL로 작성하여 ANSI 조인 사용)
	@Query("SELECT st FROM StockTransaction st WHERE st.buyer.accountId = :accountId OR st.seller.accountId = :accountId")
	List<StockTransaction> findTransactionsByAccountId(@Param("accountId") Long accountId);

	//  페이징 및 최신순 정렬을 지원하는 거래 내역 조회
	@Query("SELECT st FROM StockTransaction st WHERE st.buyer.accountId = :accountId OR st.seller.accountId = :accountId")
	Page<StockTransaction> findTransactionsByAccountId(@Param("accountId") Long accountId, Pageable pageable);

}
