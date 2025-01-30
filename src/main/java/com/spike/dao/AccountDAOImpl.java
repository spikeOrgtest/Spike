package com.spike.dao;

import java.util.Optional;

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
	public void Oneupdateaccount(Long one_limit, String account_number) {
		this.accountrepo.Oneupdateaccount(one_limit, account_number);
	}

	@Override
	public void Dayupdateaccount(Long day_limit, String account_number) {
		this.accountrepo.Dayupdateaccount(day_limit, account_number);
	}

	@Override
	public void Passwordupdateaccount(AccountDTO a) {
		this.accountrepo.Passwordupdateaccount(a.getAccount_password(), a.getAccount_number());
	}

	@Override
	public AccountDTO findByAccount(String account_number) {
		Optional<AccountDTO> result = this.accountrepo.findByAccount(account_number);

		AccountDTO member;
		if (result.isPresent()) {
			member = result.get();
		} else {
			member = null;
		}
		return member;

	}

}
