package com.spike.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spike.model.Stock;

public interface StockRepository extends JpaRepository<Stock, Integer> {
    
	// stockCode를 기반으로 주식 조회
	Optional<Stock> findByStockCode(String stockCode);

    // 상위 N개의 주식을 가져오는 네이티브 쿼리
    @Query(value = """
        SELECT * 
        FROM (
            SELECT s.*, ROWNUM r 
            FROM stock s 
            ORDER BY s.current_price DESC
        ) 
        WHERE r <= :limit
        """, nativeQuery = true)
    List<Stock> findTopStocks(@Param("limit") int limit);
}
