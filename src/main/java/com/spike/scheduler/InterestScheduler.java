package com.spike.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.spike.service.AccountService;
import com.spike.dto.AccountDTO;
import java.util.List;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class InterestScheduler {
    
    @Autowired
    private AccountService accountService;
    
    private static final Logger log = LoggerFactory.getLogger(InterestScheduler.class);

    @Scheduled(cron = "0 * * * * *") // 매 분마다 실행 (테스트용)
    public void calculateInterest() {
        log.info("이자 계산 시작: {}", LocalDateTime.now());
        
        List<AccountDTO> activeAccounts = accountService.getAllActiveAccounts();
        for (AccountDTO account : activeAccounts) {
            try {
                if (account.getBalance() > 0 && account.getTotalRate() > 0) {
                    LocalDateTime now = LocalDateTime.now();
                    LocalDateTime lastInterestDate = account.getLastInterestDate();
                    
                    if (lastInterestDate == null) {
                        lastInterestDate = account.getCreatedDate().atStartOfDay();
                    }
                    
                    long daysBetween = ChronoUnit.DAYS.between(lastInterestDate, now);
                    if (daysBetween > 0) {
                        double dailyRate = (account.getTotalRate() / 100.0) / 365.0;
                        long interest = Math.round(account.getBalance() * dailyRate * daysBetween);
                        
                        account.setBalance(account.getBalance() + interest);
                        account.setLastInterestDate(now);
                        
                        accountService.updateAccount(account);
                        log.info("계좌 {} ({}): {}일치 이자 {}원 발생 (잔액: {}원)", 
                            account.getAccountNumber(),
                            account.getAccountType(),
                            daysBetween,
                            interest,
                            account.getBalance());
                    }
                }
            } catch (Exception e) {
                log.error("계좌 {} 이자 계산 중 오류: {}", 
                    account.getAccountNumber(), e.getMessage());
            }
        }
        
        log.info("이자 계산 완료: {}", LocalDateTime.now());
    }
}