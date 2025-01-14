package com.spike.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;

@Repository
public class AccountDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void createAccount(AccountDTO account) {
        String query = "INSERT INTO Account (account_number, account_type, balance) VALUES (?, ?, ?)";
        
        try {
            jdbcTemplate.update(query, account.getAccountNumber(), account.getAccountType(), account.getBalance());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("계좌 생성에 실패했습니다.");
        }
    }
}
