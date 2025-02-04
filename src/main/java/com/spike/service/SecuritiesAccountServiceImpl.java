package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.SecuritiesAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.SecureRandom;
import java.util.List;

@Service
public class SecuritiesAccountServiceImpl implements SecuritiesAccountService {

	@Autowired
	private SecuritiesAccountRepository accountRepository;

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


	@Override
	@Transactional
	public void changeAccountPassword(Long accountId, String newPassword) {
		// 계좌 조회
		SecuritiesAccountDTO account = accountRepository.findById(accountId)
				.orElseThrow(() -> new RuntimeException("계좌를 찾을 수 없습니다."));

		// 비밀번호 검증
		if (!newPassword.matches("\\d{6}")) {
			throw new IllegalArgumentException("비밀번호는 6자리 숫자여야 합니다.");
		}

		// 비밀번호 변경
		account.setAccountPassword(newPassword);
		accountRepository.save(account);
	}

	@Override
	@Transactional
	public void deleteAccount(Long accountId) {
		// 계좌 존재 여부 확인
		SecuritiesAccountDTO account = accountRepository.findById(accountId)
				.orElseThrow(() -> new RuntimeException("계좌를 찾을 수 없습니다."));

		// 계좌 삭제
		accountRepository.delete(account);
	}
}
