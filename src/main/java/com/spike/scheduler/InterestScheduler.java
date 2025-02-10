package com.spike.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.spike.service.AccountService;
import com.spike.dto.AccountDTO;
import java.util.List;
import java.time.LocalDate;

@Component
public class InterestScheduler {
    
    @Autowired
    private AccountService accountService;
    
    // 매일 자정에 실행
    @Scheduled(cron = "0 0 0 * * *")
    public void calculateDailyInterest() {
        List<AccountDTO> accounts = accountService.getAllActiveAccounts();
        for (AccountDTO account : accounts) {
            // lastInterestDate와 현재 날짜를 비교하여 이자 계산
            if (account.getLastInterestDate() != null && 
                account.getLastInterestDate().isBefore(LocalDate.now())) {
                if (account.getAccountType().equals("예금") || account.getAccountType().equals("적금")) {
                    accountService.calculateDailyInterest(account);
                    account.setLastInterestDate(LocalDate.now()); // 이자 계산 후 lastInterestDate 업데이트
                } else if (account.getAccountType().equals("대출")) {
                    accountService.calculateDailyLoanInterest(account);
                }
            }
        }
    }   
} 