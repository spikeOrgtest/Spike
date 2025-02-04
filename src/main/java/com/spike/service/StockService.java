package com.spike.service;

import com.spike.dto.Stock;

import java.util.List;

public interface StockService {
    // 모든 주식 데이터를 가져오는 메서드
    List<Stock> getAllStocks();

    // stock ID로 특정 주식 데이터를 가져오는 메서드
    Stock getStockById(int stockId);
    
    // stockCode 기반 조회
    Stock getStockByCode(String stockCode); 
    
 // 상위 N개의 주식을 가져오는 메서드 정의
    List<Stock> getTopStocks(int limit);
    
}
