package com.spike.dao;

public interface AccountDAO {
    void saveAccount(AccountVO account);
    AccountVO getAccountById(Long accountId);
    List<AccountVO> getAccountsByUserId(Long userId);
}
