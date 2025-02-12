package com.spike.service;

import java.math.BigDecimal;
import java.util.List;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.dto.StockHolding;
import com.spike.dto.UserDTO;

public interface StockHoldingService {

	//증권 계좌 양 
	int getStockQuantity(Long sellerId, int stockId);

	//증권 계좌 ID에 해당하는 모든 주식 보유 내역을 조회합니다.
	List<StockHolding> getHoldingsByAccountId(Long accountId);

	// 증권 계좌의 각 주식 보유 내역(수량 × 현재가)을 합산하여 총 보유 금액을 계산합니다.
	public long calculateTotalStockValue(Long accountId);
}
