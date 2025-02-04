package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;

import java.util.List;

public interface SecuritiesAccountService {

    // 계좌 생성
    SecuritiesAccountDTO createAccount(SecuritiesAccountDTO accountDTO, UserDTO user);

    // 사용자 기반 계좌 조회
    List<SecuritiesAccountDTO> getAccountsByUser(UserDTO user);

    // 사용자 계좌 존재 여부 확인 (서비스에서 직접 구현)
    boolean isAccountExistsForUser(UserDTO user);
    
 // 비밀번호 변경
    void changeAccountPassword(Long accountId, String newPassword);

    // 계좌 삭제
    void deleteAccount(Long accountId);
}
