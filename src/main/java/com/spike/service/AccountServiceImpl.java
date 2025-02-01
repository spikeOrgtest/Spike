package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.spike.dao.AccountDAO;
import com.spike.dto.AccountDTO;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	private AccountDAO accountdao;
	
	@Override
	public void createAccount(AccountDTO s) {
		this.accountdao.createAccount(s);
	}

	@Override
	public void Oneupdateaccount(Long oneLimit, String accountNumber) {
		this.accountdao.Oneupdateaccount(oneLimit, accountNumber);
	}

	@Override
	public void Dayupdateaccount(Long dayLimit, String accountNumber) {
		this.accountdao.Dayupdateaccount(dayLimit, accountNumber);
	}

	@Override
	public void Passwordupdateaccount(String accountPassword, String accountNumber) {
		this.accountdao.Passwordupdateaccount(accountPassword, accountNumber);
	}

	@Override
	public void accountsecession(String accountNumber) {
		this.accountdao.accountsecession(accountNumber);
	}

	// 예금/적금 이자 계산
	@Override
	public void calculateDailyInterest(AccountDTO account) {
		LocalDate today = LocalDate.now();
		LocalDate lastCalculation = account.getLastInterestDate();
		
		if (lastCalculation == null) {
			lastCalculation = account.getStartDate();
		}
		
		long daysBetween = ChronoUnit.DAYS.between(lastCalculation, today);
		
		if (daysBetween > 0) {
			double dailyRate = account.getTotalRate() / 365.0 / 100.0;
			double interest = account.getBalance() * dailyRate * daysBetween;
			
			account.setBalance(account.getBalance() + (long)interest);
			account.setLastInterestDate(today);
			
			accountdao.updateAccount(account);
		}
	}

	// 대출 이자 계산
	@Override
	public void calculateDailyLoanInterest(AccountDTO loan) {
		LocalDate today = LocalDate.now();
		LocalDate lastCalculation = loan.getLastInterestDate();
		
		if (lastCalculation == null) {
			lastCalculation = loan.getStartDate();
		}
		
		long daysBetween = ChronoUnit.DAYS.between(lastCalculation, today);
		
		if (daysBetween > 0) {
			double dailyRate = loan.getInterestRate() / 365.0 / 100.0;
			double interest = loan.getBalance() * dailyRate * daysBetween;
			
			loan.setBalance(loan.getBalance() + (long)interest);
			loan.setLastInterestDate(today);
			
			accountdao.updateAccount(loan);
		}
	}

	@Override
	public List<AccountDTO> getAllActiveAccounts() {
		return accountdao.getAllActiveAccounts();
	}
}
