package com.spike.service;

import java.math.BigDecimal;
import java.util.List;

import com.spike.dto.AccountDTO;
import com.spike.dto.TransactionDTO;
import com.spike.dto.TransferDTO;
import com.spike.dto.TransferHistoryDTO;
import com.spike.dto.UserDTO;

public interface TransactionService {

	List<AccountDTO> getAccountList(UserDTO user);

	String getOwnerName(String toAccount);

	void transfer(TransferDTO tData);

	String getOwnerStatus(String toAccount);

	AccountDTO getAccount(Long AccountId);

	UserDTO getOwner(String AccountNumber);

	List<TransferHistoryDTO> getRecentTransfers(Long userId);

	List<TransferHistoryDTO> getTransferHistoryByAccountId(Long accountId);

	List<TransactionDTO> getTransactionsByUserId(Long userId);

}
