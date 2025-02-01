package com.spike.dao;

import com.spike.dto.AccountDTO;
import java.util.List;

public interface AccountDAO{

	void createAccount(AccountDTO s);

	void Oneupdateaccount(Long one_limit, String account_number);

	void Dayupdateaccount(Long day_limit, String account_number);

	void Passwordupdateaccount(String account_password, String account_number);

	void accountsecession(String account_number);

	void updateAccount(AccountDTO account);

	List<AccountDTO> getAllActiveAccounts();

}