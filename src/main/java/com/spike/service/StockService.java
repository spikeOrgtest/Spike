package com.spike.service;

import com.spike.dto.StockDTO;
import java.util.List;

public interface StockService {
    // 모든 주식 데이터를 가져오는 메서드
    List<StockDTO> getAllStocks();

    // 주식 ID로 특정 주식 데이터를 가져오는 메서드
    StockDTO getStockById(int stockId);
}
