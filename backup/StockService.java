package com.spike.service;

import com.spike.dto.StockDTO;
import com.spike.model.Stock;
import com.spike.repository.StockRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class StockService {
    @Autowired
    private StockRepository stockRepository;

    public List<StockDTO> getAllStocks() {
        // Repository에서 엔티티 가져오기
        List<Stock> stocks = stockRepository.findAll();
        // 엔티티를 DTO로 변환
        return stocks.stream().map(this::convertToDTO).collect(Collectors.toList());
    }

    private StockDTO convertToDTO(Stock stock) {
        StockDTO dto = new StockDTO();
        dto.setStockId(stock.getStockId());
        dto.setCompanyName(stock.getName());
        dto.setTickerSymbol(stock.getTickerSymbol());
        dto.setSector(stock.getSector());
        dto.setInitialPrice(stock.getInitialPrice());
        dto.setCurrentPrice(stock.getCurrentPrice());
        dto.setTotalShares(stock.getTotalShares());
        dto.setAvailableShares(stock.getAvailableShares());
        return dto;
    }
}
