package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.dto.StockHolding;
import com.spike.repository.StockHoldingRepository;
import com.spike.service.StockHoldingService;

import java.math.BigDecimal;
import java.util.List;

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
    
    @Override
    public List<StockHolding> getHoldingsByAccountId(Long accountId) {
        // JPQL 쿼리로 ANSI 조인을 사용하여 조회
        return stockHoldingRepository.findByHolderAccountId(accountId);
    }
    
    //주식 총액 계산
    @Override
    public long calculateTotalStockValue(Long accountId) {
        List<StockHolding> holdings = getHoldingsByAccountId(accountId);
        long totalValue = 0;
        for (StockHolding holding : holdings) {
            StockDTO stock = holding.getStock();
            totalValue += holding.getQuantity() * stock.getCurrentPrice();
        }
        return totalValue;
    }


}