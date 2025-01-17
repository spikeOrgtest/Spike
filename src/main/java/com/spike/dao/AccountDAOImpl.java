package com.spike.dao;

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
		System.out.println("잘되냐");
		this.accountrepo.save(s);
	}

}
