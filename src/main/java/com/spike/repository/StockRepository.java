package com.spike.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spike.model.Stock;

public interface StockRepository extends JpaRepository<Stock, Integer> {

    // stockCode를 기반으로 주식 조회
    Optional<Stock> findByStockCode(String stockCode);

    // 모든 주식 데이터를 가져오는 쿼리
    @Query(value = "SELECT * FROM stock", nativeQuery = true)
    List<Stock> findAllStocks();
}
