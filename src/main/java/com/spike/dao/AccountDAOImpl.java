package com.spike.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;
import com.spike.repository.AccountRepository;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Autowired
	private AccountRepository accountrepo;
	
	@Override
	public void createAccount(AccountDTO s) {
		this.accountrepo.save(s);
	}

	@Override
	public void Oneupdateaccount(Long oneLimit, String accountNumber) {
		this.accountrepo.Oneupdateaccount(oneLimit, accountNumber);
	}

	@Override
	public void Dayupdateaccount(Long dayLimit, String accountNumber) {
		this.accountrepo.Dayupdateaccount(dayLimit, accountNumber);
	}

	@Override
	public void Passwordupdateaccount(String accountPassword, String accountNumber) {
		this.accountrepo.Passwordupdateaccount(accountPassword, accountNumber);
	}

	@Override
	public void accountsecession(String accountNumber) {
		this.accountrepo.accountsecession(accountNumber);
	}

	@Override
	public List<AccountDTO> getAllActiveAccounts() {
		return this.accountrepo.findByDeletedFalse();
	}

	@Override
	public void updateAccount(AccountDTO account) {
		this.accountrepo.updateAccount(account);
	}

}
