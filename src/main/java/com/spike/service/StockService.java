package com.spike.service;

import java.util.List;
import com.spike.model.Stock;

public interface StockService {
    List<Stock> getAllStocks(); // 모든 주식 조회
    Stock getStockById(String stockId); // 특정 주식 조회
}
