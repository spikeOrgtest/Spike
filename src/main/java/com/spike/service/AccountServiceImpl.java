package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.AccountDAO;
import com.spike.dto.AccountDTO;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountDAO accountdao;
	
	@Override
	public void createAccount(AccountDTO s) {
		this.accountdao.createAccount(s);
	}

	@Override
	public void Oneupdateaccount(Long one_limit, String account_number) {
		this.accountdao.Oneupdateaccount(one_limit, account_number);
	}

	@Override
	public void Dayupdateaccount(Long day_limit, String account_number) {
		this.accountdao.Dayupdateaccount(day_limit, account_number);
	}

	@Override
	public void Passwordupdateaccount(String account_password, String account_number) {
		this.accountdao.Passwordupdateaccount(account_password, account_number);
	}

	@Override
	public void accountsecession(String account_number) {
		this.accountdao.accountsecession(account_number);
	}


}
