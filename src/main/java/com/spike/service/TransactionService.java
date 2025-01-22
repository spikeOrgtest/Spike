package com.spike.service;

import java.math.BigDecimal;
import java.util.List;

import com.spike.dto.AccountTestDTO;

public interface TransactionService {

	void transfer(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo);

	List<AccountTestDTO> getAccountList(Long user_id);

}
