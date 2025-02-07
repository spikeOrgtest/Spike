package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.repository.StockHoldingRepository;
import com.spike.service.StockHoldingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockHoldingServiceImpl implements StockHoldingService {

    @Autowired
    private StockHoldingRepository stockHoldingRepository;

    @Override
    public int getStockQuantity(Long sellerId, int stockId) {
        return stockHoldingRepository.getStockQuantity(sellerId, stockId);
    }


}