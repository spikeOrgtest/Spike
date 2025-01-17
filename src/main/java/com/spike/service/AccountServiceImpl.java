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

	
	
	
}
