package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;

import java.util.List;

public interface SecuritiesAccountService {

    // 계좌 생성
    SecuritiesAccountDTO createAccount(SecuritiesAccountDTO accountDTO);

    // 계좌 조회
    List<SecuritiesAccountDTO> getAccountsByUserId(Long userId);

    // 계좌 잔액 업데이트
    SecuritiesAccountDTO updateBalance(Long accountId, Double amount);
}
