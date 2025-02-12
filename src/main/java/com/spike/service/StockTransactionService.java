package com.spike.service;

import com.spike.dto.StockTransaction;
import java.util.List;

public interface StockTransactionService {
    
	//증권 계좌 ID에 해당하는 거래 내역을 조회합니다.(구매자 또는 판매자로 참여한 모든 거래 내역)
    List<StockTransaction> getTransactionsByAccountId(Long accountId);
}
