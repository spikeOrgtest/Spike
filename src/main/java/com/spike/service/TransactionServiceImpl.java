package com.spike.service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.spike.dto.AccountDTO;
import com.spike.dto.TransactionDTO;
import com.spike.dto.TransferDTO;
import com.spike.dto.TransferHistoryDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;
import com.spike.repository.TransactionRepository;
import com.spike.repository.UserRepository;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private AccountRepository accountRepo;

	@Autowired
	private TransactionRepository transactionRepo;


	// 사용자 계좌 목록 조회
	@Override
	public List<AccountDTO> getAccountList(UserDTO user) {
		return this.accountRepo.findByOwner(user);
	}

	// 계좌 id로 계좌 검색
	@Override
	public AccountDTO getAccount(Long AccountId) {

		return this.accountRepo.findById(AccountId).orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다."));
	}

	// getOwnerName과 getOwnerStatus 통합했음, getAccount까지 통합 가능할지 고려
	@Override
	public UserDTO getOwner(String AccountNumber) {

		return this.accountRepo.findByAccountNumber(AccountNumber)
				.orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다.")).getOwner();
	}

	// 계좌번호로 계좌 주인의 이름을 반환, 계좌의 OwnerId검색 -> OwnerId의 이름 검색
	@Override
	public String getOwnerName(String AccountNumber) {
		/*
		 * Long OwnerId = this.accountRepo.getOwnerId(AccountNumber); return
		 * this.userRepo.findById(OwnerId).orElseThrow(() -> new
		 * IllegalArgumentException("계좌를 찾을 수 없습니다.")) .getName(); //jpaRepository 내장메서드
		 * findById로 UserDTO검색, getName()으로 이름 가져옴
		 */

		// 어차피 AccountDTO 객체 안의 Owner 필드가 계좌 주인을 참조하니까 findById 건너뛰고 바로 getName 사용해도 될듯?
		// ok
		return this.accountRepo.findByAccountNumber(AccountNumber)
				.orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다.")).getOwner().getName();

	}

	// 계좌번호로 계좌 주인의 상태 반환, getOwnerName과 통합도 가능할듯
	@Override
	public String getOwnerStatus(String AccountNumber) {

		return this.accountRepo.findByAccountNumber(AccountNumber)
				.orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다.")).getOwner().getStatus();
	}

	@Transactional
	@Override
	public void transfer(TransferDTO tData) {
		// atm을 통한 입금,출금에서는 한쪽만 검증 필요(한쪽은 atm이니까), 이체에는 양쪽 다 필요
		// optional을 통한 유효성 검증, null값 반환시 계좌를 찾을 수 없다는 에러 발생
		AccountDTO fromAccount = accountRepo.findById(tData.getFromAccountId())
				.orElseThrow(() -> new IllegalArgumentException("존재하지 않는 계좌입니다. 입금계좌를 확인해 주세요!"));

		// optional 객체에서 get()메서드로 직접 꺼내는 방식(옛날 방식)
		Optional<AccountDTO> optionalToAccount = this.accountRepo.findByAccountNumber(tData.getToAccount());
		AccountDTO toAccount = null;
		if (optionalToAccount.isPresent()) {
			toAccount = optionalToAccount.get();

		} else {
			throw new IllegalArgumentException("존재하지 않는 계좌입니다. 입금계좌를 확인해 주세요!");
		}

		// 잔액 부족하면 javascript에서 걸러짐, 그래도 원래는 애플리케이션(사이트)에서 2차 예외처리 해줘야함
		if (fromAccount.getBalance() < tData.getAmount())
			throw new IllegalArgumentException("잔액이 부족한데 어떻게 송금하셨죠?");
		else if(fromAccount.getOneLimit() < tData.getAmount())
			throw new IllegalArgumentException("1회 한도 초과입니다.");
		else if(fromAccount.getAvailableLimit() < tData.getAmount())
			throw new IllegalArgumentException("일일 한도 초과입니다.");

		fromAccount.setBalance(fromAccount.getBalance() - tData.getAmount()); // BigDecimal 클래스의 내장메서드 subtract 활용 -> 보류
		fromAccount.setAvailableLimit(fromAccount.getAvailableLimit() - tData.getAmount()); //일일 한도 갱신
		toAccount.setBalance(toAccount.getBalance() + tData.getAmount());

		accountRepo.save(fromAccount);
		accountRepo.save(toAccount);

		// 트랜잭션 객체 생성, 저장
		TransactionDTO tDto = new TransactionDTO(); // 생성자 메서드로 리팩토링 고려
		tDto.setFromAccount(fromAccount);
		tDto.setToAccount(toAccount);
		tDto.setAmount(tData.getAmount());
		tDto.setTransactionType("TRANSFER");
		tDto.setStatus("COMPLETED");
		tDto.setMemo(tData.getMemo());
		tDto.setAfterBalance(fromAccount.getBalance()); // 거래기록 조회용으로 추가
		transactionRepo.save(tDto);

	}

	//이체 페이지용 계정의 최근 5건(송금만) 조회
	@Override
	public List<TransferHistoryDTO> getRecentTransfers(Long userId) {

		// 페이징 위한 pageable 객체(인데 5개만 조회할 목적으로 사용), PageRequest 정적메서드 ofSize로 객체생성 (생성자
		// 팩토리 어쩌구 패턴)
		Pageable pageable = PageRequest.ofSize(5); // == .of(0, 5) 여기선 무조건 5개만 보여줄거라 offset 0
		// pageable 사용해서 조회하면 Page<T> type으로 반환하는것 유의, .getContent()로 꺼내줘야 List<T> 되는데
		// 내부적으로 처리해주는듯??
		
		//날짜 계산은 LocalDateTime 내장메서드 minusDays 활용하는 것이 편리함, 대신 TimeStamp 객체로 변환 필요
		LocalDateTime calculatedDate = LocalDateTime.now().minusDays(1);
		Timestamp startDate = Timestamp.valueOf(calculatedDate);
		
		List<TransactionDTO> transactions = this.transactionRepo
				.getRecentTransfers(userId, startDate, pageable);
		List<TransferHistoryDTO> histories = new ArrayList<>();

		for (TransactionDTO transaction : transactions) {
			TransferHistoryDTO history = TransferHistoryDTO.builder()
					.name(transaction.getToAccount().getOwner().getName())
					.transactionDate(transaction.getTransactionDate()).amount(transaction.getAmount())
					.afterBalance(transaction.getAfterBalance()).build();
			histories.add(history);
			// if(histories.size() == 5) break; 페이징으로 db에서 5개만 가져와서 필요없어짐. 효율 good
		}

		return histories;

		/*
		 * // List -> stream으로 변환, stream 내장메서드 map을 사용해서
		 * Transaction->TransactionHistory로 변환, 다시 List로 변환 //List<T> -> stream() ->
		 * Stream<T> -> map() -> Stream<R> -> collect() -> List<R> return
		 * transactions.stream() .map(transaction -> TransferHistoryDTO.builder()
		 * .name(transaction.getToAccount().getOwnerName())
		 * .transactionDate(transaction.getTransactionDate())
		 * .amount(transaction.getAmount())
		 * .balanceAfterTransaction(transaction.getFromAccount().getBalance()) .build())
		 * .collect(Collectors.toList());
		 */
	}

	//마이페이지용 입출금 전체 조회
	@Override
	public List<TransferHistoryDTO> getTransferHistoryByAccountId(Long accountId) {
		
		List<TransactionDTO> transactions = this.transactionRepo.getTransferHistoryByAccountId(accountId);
		List<TransferHistoryDTO> histories = new ArrayList<>();
		for (TransactionDTO transaction : transactions) {
			TransferHistoryDTO history = TransferHistoryDTO.builder()
					.name(transaction.getToAccount().getOwner().getName())
					.transactionDate(transaction.getTransactionDate()).amount(transaction.getAmount())
					.afterBalance(transaction.getAfterBalance())
					.fromAccount(transaction.getFromAccount().getAccountNumber())
					.toAccount(transaction.getToAccount().getAccountNumber())
					.build();
			histories.add(history);
			// if(histories.size() == 5) break; 페이징으로 db에서 5개만 가져와서 필요없어짐. 효율 good
		}

		return histories;
	}
	
	//HistoryDTO로 변환하지 않고 바로 전체 데이터 조회
	@Override
	public List<TransactionDTO> getTransactionsByUserId(Long userId) {
		
		return this.transactionRepo.getTransactionsByUserId(userId);
	}

}
