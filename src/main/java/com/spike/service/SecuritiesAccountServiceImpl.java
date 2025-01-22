package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.repository.SecuritiesAccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SecuritiesAccountServiceImpl implements SecuritiesAccountService {

    @Autowired
    private SecuritiesAccountRepository accountRepository;

    // 계좌 생성
    @Override
    public SecuritiesAccountDTO createAccount(SecuritiesAccountDTO accountDTO) {
        // 추가 유효성 검사를 수행할 수 있음
        if (accountDTO.getInitialDeposit() < 0) {
            throw new IllegalArgumentException("Initial deposit must be greater than or equal to 0.");
        }
        return accountRepository.save(accountDTO);
    }

    // 사용자 ID로 계좌 조회
    @Override
    public List<SecuritiesAccountDTO> getAccountsByUserId(Long userId) {
        return accountRepository.findByUserId(userId);
    }

    // 계좌 잔액 업데이트
    @Override
    public SecuritiesAccountDTO updateBalance(Long accountId, Double amount) {
        Optional<SecuritiesAccountDTO> optionalAccount = accountRepository.findById(accountId);
        if (optionalAccount.isPresent()) {
            SecuritiesAccountDTO account = optionalAccount.get();
            account.setBalance(account.getBalance() + amount);
            return accountRepository.save(account);
        } else {
            throw new IllegalArgumentException("Account not found with ID: " + accountId);
        }
    }
}
