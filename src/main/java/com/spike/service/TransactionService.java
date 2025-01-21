package com.spike.service;

import java.math.BigDecimal;

public interface TransactionService {

	void transfer(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo);

}
