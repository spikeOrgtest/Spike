package com.spike.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.spike.model.Stock;

public interface StockRepository extends JpaRepository<Stock, Integer> {
	// stockCode를 기반으로 주식 조회
    Optional<Stock> findByStockCode(String stockCode);
}
