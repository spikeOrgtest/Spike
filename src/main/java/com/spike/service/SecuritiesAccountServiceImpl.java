package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockHolding;
import com.spike.dto.UserDTO;
import com.spike.repository.SecuritiesAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.SecureRandom;
import java.util.List;
import java.util.Optional;

@Service
public class SecuritiesAccountServiceImpl implements SecuritiesAccountService {

	@Autowired
	private SecuritiesAccountRepository accountRepository;
	
	@Autowired
	private StockHoldingService stockholdingService;

	@Autowired
	private PasswordEncoder passwordEncoder;

	private static final SecureRandom RANDOM = new SecureRandom();

	// 계좌 생성
	@Override
	@Transactional
	public SecuritiesAccountDTO createAccount(SecuritiesAccountDTO accountDTO, UserDTO user) {
		// 사용자 계좌 존재 여부 확인
		if (isAccountExistsForUser(user)) {
			throw new IllegalStateException("사용자 계좌가 이미 존재합니다. 추가 계좌를 생성할 수 없습니다.");
		}

		// 사용자 정보 설정
		accountDTO.setUser(user);

		// 계좌번호 생성
		accountDTO.setAccountNumber(generateRandomAccountNumber());

		// 계좌 저장
		return accountRepository.save(accountDTO);
	}

	// 13자리 랜덤 계좌번호 생성 메서드
	private String generateRandomAccountNumber() {
		// 랜덤한 12자리 숫자를 생성
		StringBuilder accountNumber = new StringBuilder();
		for (int i = 0; i < 13; i++) {
			accountNumber.append(RANDOM.nextInt(10)); // 0~9 중 랜덤 숫자 추가
		}
		return accountNumber.toString();
	}

	// 사용자의 계좌 조회 (1인당 1계좌)
	@Override
	public SecuritiesAccountDTO getAccountByUser(UserDTO user) {
		return accountRepository.findByUser(user).orElse(null);
	}


	// 사용자 계좌 존재 여부 확인
	@Override
	public boolean isAccountExistsForUser(UserDTO user) {
		return accountRepository.findByUser(user).isPresent();
	}


	//계좌 비밀번호 변경
	@Override
	@Transactional
	public void changeAccountPassword(Long accountId, String currentPassword, String newPassword) {
		// 계좌 조회
		SecuritiesAccountDTO account = accountRepository.findById(accountId)
				.orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다."));

		// 기존 비밀번호 확인 (저장된 비밀번호는 암호화되어 있음)
		if (!passwordEncoder.matches(currentPassword, account.getAccountPassword())) {
			throw new IllegalArgumentException("기존 비밀번호가 일치하지 않습니다.");
		}

		// 새 비밀번호 검증 (6자리 숫자)
		if (!newPassword.matches("\\d{6}")) {
			throw new IllegalArgumentException("새 비밀번호는 6자리 숫자여야 합니다.");
		}

		// 새 비밀번호 암호화 후 변경
		String encodedPassword = passwordEncoder.encode(newPassword);
		account.setAccountPassword(encodedPassword);
		accountRepository.save(account);
	}

	//계좌 삭제
	@Override
	@Transactional
	public void deleteAccount(Long accountId, String currentPassword) {
	    // 계좌 조회
	    SecuritiesAccountDTO account = accountRepository.findById(accountId)
	            .orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다."));

	    // 비밀번호 확인 (저장된 비밀번호는 암호화되어 있음)
	    if (!passwordEncoder.matches(currentPassword, account.getAccountPassword())) {
	        throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
	    }

	    //accountId로 보유 주식 목록 가져옴
	    List<StockHolding> stockholdings = this.stockholdingService.getHoldingsByAccountId(accountId);

	    //보유하고 있는 주식이 없으면 계좌 삭제
	    if(stockholdings.size() == 0) {
		    accountRepository.delete(account);
	    }else {
	    	throw new IllegalArgumentException("보유중인 주식이 있어 계좌를 삭제할 수 없습니다.");
	    }
	    
	}
	//계좌 찾기
	@Override
    public Optional<SecuritiesAccountDTO> getAccountById(Long accountId) {
        return accountRepository.findById(accountId);
    }
	
	//userid 찾기
	@Override
    public Optional<SecuritiesAccountDTO> getAccountByUserId(Long userId) {
        return accountRepository.findByUser_UserId(userId);
    }
	
	// 잔액 차감 (구매 시 사용)
    @Override
    @Transactional
    public void decreaseBalance(SecuritiesAccountDTO account, int amount) {
        long newBalance = account.getBalance() - amount;
        if (newBalance < 0) {
            throw new IllegalArgumentException("잔액이 부족합니다.");
        }
        account.setBalance(newBalance);
        accountRepository.save(account);
    }

    // 잔액 증가 (판매 시 사용)
    @Override
    @Transactional
    public void increaseBalance(SecuritiesAccountDTO account, int amount) {
        long newBalance = account.getBalance() + amount;
        account.setBalance(newBalance);
        accountRepository.save(account);
    }
}