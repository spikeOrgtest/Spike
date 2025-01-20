package com.spike.service;

import java.math.BigDecimal;

public interface TransactionServiece {

	void transfer(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo);

}
