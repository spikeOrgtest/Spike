package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.spike.model.Stock;

public interface StockRepository extends JpaRepository<Stock, Integer> {
    // 추가 메서드 정의 가능
}
