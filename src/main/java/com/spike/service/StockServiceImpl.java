package com.spike.service;

import java.util.List;
import com.spike.dao.StockDAO;
import com.spike.model.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockDAO stockDAO;

    @Override
    public List<Stock> getAllStocks() {
        return stockDAO.findAllStocks();
    }

    @Override
    public Stock getStockById(String stockId) {
        return stockDAO.findStockById(stockId);
    }
}
