package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spike.dto.AccountDTO;
import com.spike.repository.AccountRepository;

@Service
public class AccountService {

	private final AccountRepository accountRepository;
	 
	@Autowired
	public AccountService(AccountRepository accountRepository) {
		this.accountRepository = accountRepository;
	}

	public boolean createAccount(AccountDTO accountDTO) {
        try {
            // AccountDTO 객체를 DB에 저장
            accountRepository.save(accountDTO);
            return true;
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
            return false;
        }
    }
}
