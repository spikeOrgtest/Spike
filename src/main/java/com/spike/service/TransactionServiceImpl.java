package com.spike.service;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.UserRepository;
import com.spike.dto.AccountDTO;
import com.spike.dto.AccountTestDTO;
import com.spike.dto.TransactionDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;
import com.spike.repository.AccountTestRepository;
import com.spike.repository.TransactionRepository;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private AccountRepository accountRepo;
	
	@Autowired
	private TransactionRepository transactionRepo;

	@Autowired
	private UserRepository userRepo;
	
	@Transactional
	@Override
	public void transfer(Long fromAccountId, Long toAccountId, long amount, String memo) {
		
		//atm을 통한 입금,출금에서는 한쪽만 검증 필요(한쪽은 atm이니까), 이체에는 양쪽 다 필요 
		AccountDTO fromAccount = accountRepo.findById(fromAccountId)
				.orElseThrow(() -> new IllegalArgumentException("출금 계좌를 찾을 수 없습니다."));

		AccountDTO toAccount = accountRepo.findById(toAccountId)
				.orElseThrow(() -> new IllegalArgumentException("입금 계좌를 찾을 수 없습니다."));


		fromAccount.setBalance(fromAccount.getBalance() - amount); //BigDecimal 클래스의 내장메서드 subtract 활용
		toAccount.setBalance(toAccount.getBalance() + amount);
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

	@Override
	public List<AccountDTO> getAccountList(UserDTO user) {
		return this.accountRepo.findByOwner(user);
		
		//return this.accountRepo.getAccountList(user_id);
		//return this.accountRepo.findByOwnerUserIdNative(user_id);
//		System.out.println(this.accountRepo.findRawResults(user_id));
//		System.out.println(this.accountRepo.findAccounts());
//		System.out.println(this.accountRepo.cntAccounts());
//		System.out.println("--------------------");
//		System.out.println(this.accountRepo.cntAccountsByOwnerUserId());
//		System.out.println("--------------------");
//		System.out.println(this.accountRepo.cntAccountsWithDtype());
//		System.out.println("--------------------");
//		System.out.println(this.accountRepo.cntAll());
		
//		AccountTestDTO account = new AccountTestDTO();
//		if(this.userRepo.findById(user_id).isPresent()) {
//			UserDTO user = this.userRepo.findById(user_id).get();
//			account.setOwner(user);
//		}
//		account.setBalance(BigDecimal.valueOf(1000L));
//		this.accountRepo.save(account);

		
		//return null;
	}

}
