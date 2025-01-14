package com.spike.dao;

import java.util.List;
import com.spike.model.Stock;

public interface StockDAO {
    List<Stock> findAllStocks(); // 모든 주식 조회
    Stock findStockById(String stockId); // 특정 주식 조회
}
