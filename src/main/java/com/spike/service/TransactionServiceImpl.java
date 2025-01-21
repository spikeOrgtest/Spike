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
	private TransactionRepository transactionRepo;

	@Transactional
	@Override
	public void transfer(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo) {
		
		//atm을 통한 입금,출금에서는 한쪽만 검증 필요(한쪽은 atm이니까), 이체에는 양쪽 다 필요 
		AccountTestDTO fromAccount = accountRepo.findById(fromAccountId)
				.orElseThrow(() -> new IllegalArgumentException("출금 계좌를 찾을 수 없습니다."));

		AccountTestDTO toAccount = accountRepo.findById(toAccountId)
				.orElseThrow(() -> new IllegalArgumentException("입금 계좌를 찾을 수 없습니다."));


		fromAccount.setBalance(fromAccount.getBalance().subtract(amount)); //BigDecimal 클래스의 내장메서드 subtract 활용
		toAccount.setBalance(toAccount.getBalance().add(amount));
		accountRepo.save(fromAccount);
		accountRepo.save(toAccount);

		//트랜잭션 객체 생성, 저장
		TransactionDTO tDto = new TransactionDTO(); //생성자 메서드로 리팩토링 고려
		tDto.setFromAccount(fromAccount);
		tDto.setToAccount(toAccount);
		tDto.setAmount(amount);
		tDto.setTransactionType("TRANSFER");
		tDto.setStatus("COMPLETED");
		tDto.setMemo(memo);
		transactionRepo.save(tDto);
	}

}
