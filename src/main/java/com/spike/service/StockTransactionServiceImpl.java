package com.spike.service;

import com.spike.dto.StockTransaction;
import com.spike.repository.StockTransactionRepository;
import com.spike.service.StockTransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StockTransactionServiceImpl implements StockTransactionService {

    @Autowired
    private StockTransactionRepository stockTransactionRepository;

    @Override
    public List<StockTransaction> getTransactionsByAccountId(Long accountId) {
        // 위에서 작성한 JPQL 쿼리 메서드를 호출합니다.
        return stockTransactionRepository.findTransactionsByAccountId(accountId);
    }
}
