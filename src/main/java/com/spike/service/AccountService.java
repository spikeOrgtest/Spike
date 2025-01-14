package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spike.model.Account;
import com.spike.repository.AccountRepository;
import com.spike.dto.AccountDTO;

import java.util.Date;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    // 계좌 저장 메서드
    public void createAccount(AccountDTO accountDTO) {
        // AccountDTO를 Account 엔티티로 변환
        Account account = new Account(
                accountDTO.getAccountNumber(), 
                accountDTO.getAccountType(), 
                accountDTO.getBalance(),
                accountDTO.getUserId(),
                accountDTO.getCreatedDate()
        );
        
        accountRepository.save(account);  // DB에 계좌 저장
    }
}
