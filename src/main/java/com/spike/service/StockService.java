package com.spike.service;

import com.spike.dto.StockDTO;


import java.util.List;
import java.util.Optional;

public interface StockService {
	// 모든 주식 데이터를 가져오는 메서드
	List<StockDTO> getAllStocks();

	// stock ID로 특정 주식 데이터를 가져오는 메서드
	 Optional<StockDTO> getStockById(int stockId);

	// 상위 N개의 주식을 가져오는 메서드 정의
	List<StockDTO> getTopStocks(int limit);
	
	//거래후 주식의 현재가 갱신 메소드
	public void updateStockCurrentPrice(StockDTO stock);
	
	// 오버로딩: 새로운 가격을 받아 현재가를 갱신하는 메서드
    public void updateStockCurrentPrice(StockDTO stock, int newPrice);
	
	// 주식 이름을 기준으로 검색하는 메서드 추가 (대소문자 무시)
    List<StockDTO> searchStocksByName(String query);

}
