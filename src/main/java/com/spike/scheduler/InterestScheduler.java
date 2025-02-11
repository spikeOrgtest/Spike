package com.spike.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.spike.service.AccountService;
import com.spike.dto.AccountDTO;
import java.util.List;
import java.util.Date;
import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Component
public class InterestScheduler {

    @Autowired
    private AccountService accountService;

    private static final Logger log = LoggerFactory.getLogger(InterestScheduler.class);

    @Scheduled(cron = "0 * * * * *")
    public void calculateInterest() {
        log.info("이자 계산 시작: " + new Date());

        List<AccountDTO> activeAccounts = accountService.getAllActiveAccounts();
        for (AccountDTO account : activeAccounts) {
            try {
                if (account.getBalance() > 0 && account.getTotalRate() > 0) {
                    Date now = new Date();
                    Date lastInterestDate = account.getLastInterestDate();

                    if (lastInterestDate == null) {
                        lastInterestDate = new Timestamp(account.getCreatedDate().getTime());
                    }

                    long diffInMillies = Math.abs(now.getTime() - lastInterestDate.getTime());
                    long daysBetween = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);

                    if (daysBetween > 0) {
                        double dailyRate = (account.getTotalRate() / 100.0) / 365.0;
                        long interest = Math.round(account.getBalance() * dailyRate * daysBetween);

                        account.setBalance(account.getBalance() + interest);
                        account.setLastInterestDate(now);

                        accountService.updateAccount(account);
                        log.info("계좌 " + account.getAccountNumber() +
                                " (" + account.getAccountType() + "): " +
                                daysBetween + "일치 이자 " + interest + "원 발생 (잔액: " +
                                account.getBalance() + "원)");
                    }
                }
            } catch (Exception e) {
                log.error("계좌 " + account.getAccountNumber() + " 이자 계산 중 오류: " +
                        e.getMessage());
            }
        }

        log.info("이자 계산 완료: " + new Date());
    }
}