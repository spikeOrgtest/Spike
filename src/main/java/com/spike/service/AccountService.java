package com.spike.service;

import com.spike.dto.AccountDTO;
import java.util.List;

public interface AccountService {

	void createAccount(AccountDTO s);

	void Oneupdateaccount(Long oneLimit, String accountNumber);

	void Dayupdateaccount(Long dayLimit, String accountNumber);

	void Passwordupdateaccount(String accountPassword, String accountNumber);

	void accountsecession(String accountNumber);
	
	void calculateDailyInterest(AccountDTO account);

	void calculateDailyLoanInterest(AccountDTO loan);
	
	List<AccountDTO> getAllActiveAccounts();
  
}
