package com.spike.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dto.TransactionDTO;
import com.spike.repository.TransactionRepository;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionRepository transRepo;
	
	@Override
	public void transfer(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo) {
		TransactionDTO transDto = new TransactionDTO();
		this.transRepo.save(transDto);
	}

}
