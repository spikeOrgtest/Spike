package com.spike.dao;

import java.util.List;
import java.util.ArrayList;
import com.spike.model.Stock;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAOImpl implements StockDAO {

    @Override
    public List<Stock> findAllStocks() {
        // 예시 데이터 (실제 구현에서는 DB 연동 코드 작성)
        return List.of(
            new Stock("삼성전자", 10, 70000, 700000, 10.5),
            new Stock("LG화학", 5, 800000, 4000000, 8.2)
        );
    }

    @Override
    public Stock findStockById(String stockId) {
        // 예시 로직 (실제 구현에서는 DB 조회로 대체)
        List<Stock> stocks = findAllStocks();
        return stocks.stream()
                     .filter(stock -> stock.getName().equals(stockId))
                     .findFirst()
                     .orElse(null);
    }
}
