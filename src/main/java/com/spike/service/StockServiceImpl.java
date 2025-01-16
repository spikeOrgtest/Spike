package com.spike.service;

import com.spike.dto.StockDTO;
import com.spike.model.Stock;
import com.spike.repository.StockRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockRepository stockRepository;

    // 모든 주식 데이터를 가져오는 메서드
    @Override
    public List<StockDTO> getAllStocks() {
        return stockRepository.findAll().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    // 주식 ID로 특정 주식 데이터를 가져오는 메서드
    @Override
    public StockDTO getStockById(int stockId) {
        return stockRepository.findById(stockId)
                .map(this::convertToDTO)
                .orElseThrow(() -> new RuntimeException("Stock not found with ID: " + stockId));
    }

    // stock_code로 특정 주식 데이터를 가져오는 메서드
    @Override
    public StockDTO getStockByCode(String stockCode) {
        return stockRepository.findByStockCode(stockCode)
                .map(this::convertToDTO)
                .orElseThrow(() -> new RuntimeException("Stock not found with Code: " + stockCode));
    }

    // 상위 N개의 주식을 가져오는 메서드
    @Override
    public List<StockDTO> getTopStocks(int limit) {
        // 모든 주식 데이터를 가져옴
        List<Stock> allStocks = stockRepository.findAllStocks();

        // 현재가 기준으로 정렬 후 상위 limit개의 데이터를 추출
        return allStocks.stream()
                .sorted(Comparator.comparingDouble(Stock::getCurrentPrice).reversed())
                .limit(limit)
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    // 엔티티를 DTO로 변환하는 메서드
    private StockDTO convertToDTO(Stock stock) {
        StockDTO dto = new StockDTO();
        dto.setStockId(stock.getStockId());
        dto.setStockCode(stock.getStockCode());
        dto.setCompanyName(stock.getCompanyName());
        dto.setTickerSymbol(stock.getTickerSymbol());
        dto.setSector(stock.getSector());
        dto.setInitialPrice(stock.getInitialPrice());
        dto.setCurrentPrice(stock.getCurrentPrice());
        dto.setTotalShares(stock.getTotalShares());
        dto.setAvailableShares(stock.getAvailableShares());
        return dto;
    }
}
