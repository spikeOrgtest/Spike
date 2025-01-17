package com.spike.service;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.repository.SecuritiesAccountRepository;
import com.spike.service.SecuritiesAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SecuritiesAccountServiceImpl implements SecuritiesAccountService {

    @Autowired
    private SecuritiesAccountRepository accountRepository;

    @Override
    public SecuritiesAccountDTO createAccount(SecuritiesAccountDTO accountDTO) {
        return accountRepository.save(accountDTO);
    }

    @Override
    public List<SecuritiesAccountDTO> getAccountsByUserId(Long userId) {
        return accountRepository.findByUserId(userId);
    }

    @Override
    public SecuritiesAccountDTO updateBalance(Long accountId, Double amount) {
        SecuritiesAccountDTO account = accountRepository.findById(accountId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid account ID"));
        account.setBalance(account.getBalance() + amount);
        return accountRepository.save(account);
    }
}
