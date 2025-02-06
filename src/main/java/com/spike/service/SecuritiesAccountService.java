package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;

import java.util.List;
import java.util.Optional;

public interface SecuritiesAccountService {

	// 계좌 생성
	SecuritiesAccountDTO createAccount(SecuritiesAccountDTO accountDTO, UserDTO user);

	// 사용자의 증권 계좌 조회 (1인당 1계좌)
	SecuritiesAccountDTO getAccountByUser(UserDTO user);

	// 사용자 계좌 존재 여부 확인 (서비스에서 직접 구현)
	boolean isAccountExistsForUser(UserDTO user);

	//계좌 비밀번호 변경
	void changeAccountPassword(Long accountId, String currentPassword, String newPassword);

	// 계좌 삭제
	void deleteAccount(Long accountId, String currentPassword);
	
	//계좌 찾기
	Optional<SecuritiesAccountDTO> getAccountById(Long accountId);
	
	//userid찾기
	Optional<SecuritiesAccountDTO> getAccountByUserId(Long userId);


}
