package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.StockDTO;
import com.spike.model.Stock;

@Repository
public interface StockRepository extends JpaRepository<Stock, Integer> {
}
