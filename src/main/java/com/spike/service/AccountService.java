package com.spike.service;

import java.util.List;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;

public interface AccountService {

	void createAccount(AccountDTO s);

	void Oneupdateaccount(Long oneLimit, String accountNumber);

	void Dayupdateaccount(Long dayLimit, String accountNumber);

	void Passwordupdateaccount(AccountDTO a);

	AccountDTO findByAccount(String account_number);

	void accountsecession(String accountNumber);

	void calculateDailyInterest(AccountDTO account);

	void calculateDailyLoanInterest(AccountDTO loan);

	List<AccountDTO> getAllActiveAccounts();

	List<AccountDTO> findbyAccountInfo(String detailValue);

	List<AccountDTO> getActiveAccountsForUser(UserDTO user);
	
	void updateAccount(AccountDTO account);

}
