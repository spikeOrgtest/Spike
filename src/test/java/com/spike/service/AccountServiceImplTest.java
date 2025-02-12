package com.spike.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import java.util.Calendar;
import java.util.Date;
import com.spike.dto.AccountDTO;
import com.spike.repository.AccountRepository;

@SpringBootTest
public class AccountServiceImplTest {

    @Autowired
    private AccountService accountService;
    
    @Autowired
    private AccountRepository accountRepository;

    @Test
    public void testInterestCalculation() {
        // 테스트용 계좌 생성
        AccountDTO account = new AccountDTO();
        account.setAccountType("예금");
        account.setBalance(1000000L);
        
        // 30일 전 날짜 설정
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, -30);
        Date thirtyDaysAgo = cal.getTime();
        
        account.setStartDate(thirtyDaysAgo);
        account.setLastInterestDate(thirtyDaysAgo);
        account.setAccountPassword("123123");
        
        // AccountDTO의 PrePersist에 의해 자동으로 이자율이 설정됨 
        // 예금의 경우 기본금리 4.0% + 우대금리 2.0% = 총 6.0%
        
        // 계좌 저장
        AccountDTO savedAccount = accountRepository.save(account);
        
        // 이자 계산 실행
        accountService.calculateDailyInterest(savedAccount);
    
        // DB에서 계좌 다시 조회
        AccountDTO updatedAccount = accountRepository.findById(savedAccount.getAccountId()).orElseThrow();
        
        // 검증
        // 30일 동안의 이자 계산: 1,000,000 * (6.0% / 365) * 30 ≈ 4,931원
        assertTrue(updatedAccount.getBalance() > 1000000L);
        assertTrue(Math.abs(new Date().getTime() - updatedAccount.getLastInterestDate().getTime()) < 1000); // 1초 이내 차이
        
        System.out.println("Original balance: 1,000,000");
        System.out.println("Updated balance: " + updatedAccount.getBalance());
        System.out.println("Interest earned: " + (updatedAccount.getBalance() - 1000000L));
    }
}