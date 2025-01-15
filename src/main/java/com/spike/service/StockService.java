package com.spike.service;

import com.spike.dto.StockDTO;

import java.util.List;

public interface StockService {
    // 모든 주식 데이터를 가져오는 메서드
    List<StockDTO> getAllStocks();

    // stock ID로 특정 주식 데이터를 가져오는 메서드
    StockDTO getStockById(int stockId);
    
    // stockCode 기반 조회
    StockDTO getStockByCode(String stockCode); 
    
    // 상위 N개 주식 데이터를 가져오는 메서드
    List<StockDTO> getTopStocks(int limit);
}
