package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spike.dto.AccountDTO;
import com.spike.model.Account;
import com.spike.repository.AccountRepository;

@Service
public class AccountService {

	private final AccountRepository accountRepository;
	
	@Autowired
	public AccountService(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}

	@Transactional
	public void createAccount(AccountDTO accountDTO) {
		try {
	        Account account = new Account();
	        account.setName(accountDTO.getName());
	        account.setSsn(accountDTO.getSsn());
	        account.setEmail(accountDTO.getEmail());
	        account.setPassword(accountDTO.getPassword());
	        
	        accountRepository.save(account);
	        System.out.println("계좌가 성공적으로 저장되었습니다.");
	    } catch (Exception e) {
	        System.out.println("계좌 저장 실패: " + e.getMessage());
	        throw e;
	    }
	}
}
