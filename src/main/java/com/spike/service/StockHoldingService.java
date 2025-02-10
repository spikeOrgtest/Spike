package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.dto.UserDTO;

public interface StockHoldingService {

	
	int getStockQuantity(Long sellerId, int stockId);


}
