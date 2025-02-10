package com.spike.repository;

import com.spike.dto.StockTransaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StockTransactionRepository extends JpaRepository<StockTransaction, Integer> {

    // ✅ 특정 주식의 가장 최근 거래 가격을 가져오는 쿼리 (최신 1개만 반환)
    @Query("SELECT st.price FROM StockTransaction st WHERE st.stock.stockId = :stockId ORDER BY st.transactionTime DESC")
    List<Double> findLatestTransactionPrices(@Param("stockId") int stockId);
}
