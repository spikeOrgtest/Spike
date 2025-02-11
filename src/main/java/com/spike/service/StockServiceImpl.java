package com.spike.service;

import com.spike.dto.StockDTO;
import com.spike.repository.StockRepository;
import com.spike.repository.StockTransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    private StockRepository stockRepository;

    @Autowired
    private StockTransactionRepository stockTransactionRepository;

    // 모든 주식 데이터를 가져오는 메서드
    @Override
    public List<StockDTO> getAllStocks() {
        // native query를 통해 전체 주식 데이터를 가져옴
        return stockRepository.findAllStocks().stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }

    // 주식 ID로 특정 주식 데이터를 가져오는 메서드 
    @Override
    public Optional<StockDTO> getStockById(int stockId) {
        return stockRepository.findById(stockId);
    }

    // 상위 N개의 주식을 가져오는 메서드 (현재가 기준 내림차순 정렬)
    @Override
    public List<StockDTO> getTopStocks(int limit) {
        // 전체 주식 데이터를 native query를 통해 조회
        List<StockDTO> allStocks = stockRepository.findAllStocks();

        return allStocks.stream()
                .sorted(Comparator.comparingDouble(StockDTO::getCurrentPrice).reversed())
                .limit(limit)
                .map(this::convertToDTO)
                .collect(Collectors.toList());
    }
    
    

    // 엔티티를 DTO로 변환하는 메서드 
    private StockDTO convertToDTO(StockDTO stock) {
        StockDTO dto = new StockDTO();
        dto.setStockId(stock.getStockId());
        dto.setCompanyName(stock.getCompanyName());
        dto.setTickerSymbol(stock.getTickerSymbol());
        dto.setSector(stock.getSector());
        dto.setInitialPrice(stock.getInitialPrice());
        dto.setCurrentPrice(stock.getCurrentPrice());
        dto.setTotalShares(stock.getTotalShares());
        return dto;
    }

    // 거래 후 주식의 현재가 갱신 메서드
    @Override
    @Transactional
    public void updateStockCurrentPrice(StockDTO stock) {
        // 최신 거래 가격을 조회 (List<Long> 반환)
        List<Long> latestPrices = stockTransactionRepository.findLatestTransactionPrices(stock.getStockId());
        if (!latestPrices.isEmpty()) {
            stock.setCurrentPrice(latestPrices.get(0)); // 최신 거래 가격 반영
            stockRepository.save(stock);
        }
    }
    
    //회사이름 검색 메소드
    @Override
    public List<StockDTO> searchStocksByName(String query) {
        // 전체 주식 중 회사명이 query를 포함하는 모든 주식을 반환
        List<StockDTO> results = stockRepository.findByCompanyNameContainingIgnoreCase(query);
        // 디버깅: 결과 건수를 출력
        System.out.println("검색어 [" + query + "]로 검색한 결과 건수: " + results.size());
        return results;
    }
}
