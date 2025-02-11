package com.spike.dao;

import java.util.List;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;
public interface AccountDAO {

	void createAccount(AccountDTO s);

	void Oneupdateaccount(Long oneLimit, String accountNumber);

	void Dayupdateaccount(Long dayLimit, String accountNumber);

	void Passwordupdateaccount(AccountDTO a);

	AccountDTO findByAccount(String account_number);

	void accountsecession(String accountNumber);

	void updateAccount(AccountDTO account);

	List<AccountDTO> getAllActiveAccounts();

	List<AccountDTO> findbyAccountInfo(String detailValue);

	List<AccountDTO> findActiveAccountsByUser(UserDTO user);

	AccountDTO findByAccountId(Long id);

	void updateAccountState(Long accountId, String accountState);

}