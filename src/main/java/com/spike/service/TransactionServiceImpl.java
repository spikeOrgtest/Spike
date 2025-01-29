package com.spike.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.repository.UserRepository;
import com.spike.dto.AccountDTO;
import com.spike.dto.TransactionDTO;
import com.spike.dto.TransferDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;
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
	public void transfer(Long fromAccountId, String toAccountNumber, long amount, String memo, String accountPassword) {

		//atm을 통한 입금,출금에서는 한쪽만 검증 필요(한쪽은 atm이니까), 이체에는 양쪽 다 필요 
		//optional을 통한 유효성 검증, null값 반환시 계좌를 찾을 수 없다는 에러 발생
		AccountDTO fromAccount = accountRepo.findById(fromAccountId)
				.orElseThrow(() -> new IllegalArgumentException("출금 계좌를 찾을 수 없습니다."));

		//optional 객체에서 get()메서드로 직접 꺼내는 방식
		Optional<AccountDTO> optionalToAccount = this.accountRepo.findByAccountNumber(toAccountNumber);
		AccountDTO toAccount = null;
		if(optionalToAccount.isPresent()) {
			toAccount = optionalToAccount.get();

		}else {
			throw new IllegalArgumentException("입금 계좌를 찾을 수 없습니다.");
		}

		fromAccount.setBalance(fromAccount.getBalance() - amount); //BigDecimal 클래스의 내장메서드 subtract 활용 -> 보류
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

	//사용자 계좌 목록 조회
	@Override
	public List<AccountDTO> getAccountList(UserDTO user) {
		return this.accountRepo.findByOwner(user);
	}

	//계좌번호로 계좌 주인의 이름을 반환, 계좌의 OwnerId검색 -> OwnerId의 이름 검색
	@Override
	public String getOwnerName(String AccountNumber) {
		/*Long OwnerId = this.accountRepo.getOwnerId(AccountNumber);
		return this.userRepo.findById(OwnerId).orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다."))
				.getName(); //jpaRepository 내장메서드 findById로 UserDTO검색, getName()으로 이름 가져옴 */

		//어차피 AccountDTO 객체 안의 Owner 필드가 계좌 주인을 참조하니까 findById 건너뛰고 바로 getName 사용해도 될듯? ok
		return this.accountRepo.findByAccountNumber(AccountNumber)
				.orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다."))
				.getOwner().getName();

	}
	@Transactional
	@Override
	public void transfer(TransferDTO tData) {
		//atm을 통한 입금,출금에서는 한쪽만 검증 필요(한쪽은 atm이니까), 이체에는 양쪽 다 필요 
		//optional을 통한 유효성 검증, null값 반환시 계좌를 찾을 수 없다는 에러 발생
		AccountDTO fromAccount = accountRepo.findById(tData.getFromAccountId())
				.orElseThrow(() -> new IllegalArgumentException("출금 계좌를 찾을 수 없습니다."));

		//optional 객체에서 get()메서드로 직접 꺼내는 방식(옛날 방식)
		Optional<AccountDTO> optionalToAccount = this.accountRepo.findByAccountNumber(tData.getToAccount());
		AccountDTO toAccount = null;
		if(optionalToAccount.isPresent()) {
			toAccount = optionalToAccount.get();

		}else {
			throw new IllegalArgumentException("입금 계좌를 찾을 수 없습니다.");
		}

		fromAccount.setBalance(fromAccount.getBalance() - tData.getAmount()); //BigDecimal 클래스의 내장메서드 subtract 활용 -> 보류
		toAccount.setBalance(toAccount.getBalance() + tData.getAmount());

		accountRepo.save(fromAccount);
		accountRepo.save(toAccount);

		//트랜잭션 객체 생성, 저장
		TransactionDTO tDto = new TransactionDTO(); //생성자 메서드로 리팩토링 고려
		tDto.setFromAccount(fromAccount);
		tDto.setToAccount(toAccount);
		tDto.setAmount(tData.getAmount());
		tDto.setTransactionType("TRANSFER");
		tDto.setStatus("COMPLETED");
		tDto.setMemo(tData.getMemo());
		transactionRepo.save(tDto);
	}

}
