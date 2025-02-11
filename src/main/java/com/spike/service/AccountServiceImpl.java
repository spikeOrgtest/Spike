package com.spike.service;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.AccountDAO;
import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;

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
	public void Passwordupdateaccount(AccountDTO a) {
		this.accountdao.Passwordupdateaccount(a);
	}

	@Override
	public AccountDTO findByAccount(String account_number) {
		return this.accountdao.findByAccount(account_number);
	}

	@Override
	public void accountsecession(String accountNumber) {
		this.accountdao.accountsecession(accountNumber);
	}

	// 예금/적금 이자 계산
	@Override
	public void calculateDailyInterest(AccountDTO account) {
		Date now = new Date();
		Date lastCalculation = account.getLastInterestDate();

		if (lastCalculation == null) {
			lastCalculation = account.getStartDate();
		}

		if (lastCalculation == null) {
			lastCalculation = new Date();
			account.setStartDate(lastCalculation);
			account.setLastInterestDate(lastCalculation);
			updateAccount(account);
			return;
		}

		// 일수 계산
		long diff = now.getTime() - lastCalculation.getTime();
		long daysBetween = diff / (24 * 60 * 60 * 1000);

		if (daysBetween > 0) {
			double dailyRate = account.getTotalRate() / 365.0 / 100.0;
			double interest = account.getBalance() * dailyRate * daysBetween;

			account.setBalance(account.getBalance() + (long) interest);
			account.setLastInterestDate(now);

			accountdao.updateAccount(account);
		}
	}

	// 대출 이자 계산 (1분 단위)
	@Override
	public void calculateDailyLoanInterest(AccountDTO loan) {
		Date currentTime = new Date();
		Date lastCalculation = loan.getLastInterestDate();

		if (lastCalculation == null) {
			lastCalculation = loan.getStartDate();
		}

		if (lastCalculation == null) {
			lastCalculation = new Date();
			loan.setStartDate(lastCalculation);
			loan.setLastInterestDate(lastCalculation);
			updateAccount(loan);
			return;
		}

		// 분 단위 계산
		long diff = currentTime.getTime() - lastCalculation.getTime();
		long minutesBetween = diff / (60 * 1000);

		if (minutesBetween > 0) {
			double minuteRate = loan.getTotalRate() / (365.0 * 24 * 60) / 100.0;
			double interest = loan.getBalance() * minuteRate * minutesBetween;
			
			System.out.println("대출 이자 계산 (1분 단위):");
			System.out.println("계좌번호: " + loan.getAccountNumber());
			System.out.println("현재 잔액: " + loan.getBalance());
			System.out.println("분당 이자율: " + String.format("%.8f%%", minuteRate * 100));
			System.out.println("경과 시간(분): " + minutesBetween);
			System.out.println("발생 이자: " + (long)interest);

			loan.setBalance(loan.getBalance() + (long) interest);
			loan.setLastInterestDate(currentTime);

			updateAccount(loan);
		}
	}

	@Override
	public List<AccountDTO> getAllActiveAccounts() {
		return accountdao.getAllActiveAccounts();
	}

	@Override
	public List<AccountDTO> findbyAccountInfo(String detailValue) {
		return this.accountdao.findbyAccountInfo(detailValue);
	}

	@Override
	public List<AccountDTO> getActiveAccountsForUser(UserDTO user) {
		return accountdao.findActiveAccountsByUser(user);
	}

	@Override
	public void updateAccount(AccountDTO account) {
		this.accountdao.updateAccount(account); // AccountDAO에서 계좌 업데이트
	}

	@Override
	public Optional<AccountDTO> findById(Long accountId) {
		return accountdao.findById(accountId);
	}

}
