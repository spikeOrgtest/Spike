package com.spike.service;

import java.math.BigDecimal;
import java.util.List;

import com.spike.dto.AccountDTO;
import com.spike.dto.TransferDTO;
import com.spike.dto.UserDTO;

public interface TransactionService {

	List<AccountDTO> getAccountList(UserDTO user);

	void transfer(Long fromAccountId, String toAccount, long amount, String memo, String accountPassword);

	String getOwnerName(String toAccount);

	void transfer(TransferDTO tData);

}
