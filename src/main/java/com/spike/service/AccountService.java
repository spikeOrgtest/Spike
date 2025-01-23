package com.spike.service;

import com.spike.dto.AccountDTO;


public interface AccountService {

	void createAccount(AccountDTO s);

	void Oneupdateaccount(Long one_limit, String account_number);

	void Dayupdateaccount(Long day_limit, String account_number);

	void Passwordupdateaccount(String account_password, String account_number);

	void accountsecession(String account_number);

}
