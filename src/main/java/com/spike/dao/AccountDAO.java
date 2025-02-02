package com.spike.dao;

import com.spike.dto.AccountDTO;
import java.util.List;

public interface AccountDAO{

	void createAccount(AccountDTO s);

	void Oneupdateaccount(Long oneLimit, String accountNumber);

	void Dayupdateaccount(Long dayLimit, String accountNumber);

	void Passwordupdateaccount(String accountPassword, String accountNumber);

	void accountsecession(String accountNumber);

	void updateAccount(AccountDTO account);

	List<AccountDTO> getAllActiveAccounts();

}