package com.spike.service;

import java.math.BigDecimal;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dto.AccountTestDTO;
import com.spike.dto.TransactionDTO;
import com.spike.repository.AccountTestRepository;
import com.spike.repository.TransactionRepository;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private AccountTestRepository accountRepo;
	
	@Autowired
	private TransactionRepository transRepo;

	@Transactional
	@Override
	public void transfer(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo) {
		AccountTestDTO fromAccount = accountRepository.findById(fromAccountId)
				.orElseThrow(() -> new IllegalArgumentException("출금 계좌를 찾을 수 없습니다."));

		// 입금 계좌 검증
		AccountTestDTO toAccount = accountRepository.findById(toAccountId)
				.orElseThrow(() -> new IllegalArgumentException("입금 계좌를 찾을 수 없습니다."));


		fromAccount.setBalance(fromAccount.getBalance().subtract(amount));
		toAccount.setBalance(toAccount.getBalance().add(amount));
		accountRepository.save(fromAccount);
		accountRepository.save(toAccount);

		// 트랜잭션 생성 및 저장
		TransactionDTO transaction = new TransactionDTO();
		transaction.setFromAccount(fromAccount);
		transaction.setToAccount(toAccount);
		transaction.setAmount(amount);
		transaction.setTransactionType("TRANSFER");
		transaction.setStatus("COMPLETED");
		transaction.setMemo(memo);
		transactionRepository.save(transaction);
		TransactionDTO transDto = new TransactionDTO();
		this.transRepo.save(transDto);
	}

}
