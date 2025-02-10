package com.spike.repository;

import java.util.List;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.StockDTO;

public interface StockRepository extends JpaRepository<StockDTO, Integer> {


    // 모든 주식 데이터를 가져오는 쿼리
    @Query(value = "SELECT * FROM stock", nativeQuery = true)
    List<StockDTO> findAllStocks();
}
