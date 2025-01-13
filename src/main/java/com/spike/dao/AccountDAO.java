package com.spike.dao;

import java.util.List;

import com.spike.dto.AccountDTO;

public interface AccountDAO {
    void saveAccount(AccountDTO account);
    AccountDTO getAccountById(Long accountId);
    List<AccountDTO> getAccountsByUserId(Long userId);
}
