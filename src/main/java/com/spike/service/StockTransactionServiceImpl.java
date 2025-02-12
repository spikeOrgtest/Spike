package com.spike.service;

import com.spike.dto.StockTransaction;

import com.spike.repository.StockTransactionRepository;
import com.spike.service.StockTransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
    
    
    @Override
    public Page<StockTransaction> getTransactionsByAccountId(Long accountId, Pageable pageable) {
        return stockTransactionRepository.findTransactionsByAccountId(accountId, pageable);
    }
}
