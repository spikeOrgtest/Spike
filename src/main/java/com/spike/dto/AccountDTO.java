package com.spike.dto;

import java.util.Date;

public class AccountDTO {
    private Long accountId;
    private Long userId;
    private String accountNumber;
    private String accountType;
    private Long balance;
    private Date createdDate;

    // 기본 생성자, getters, setters, toString 등

    public AccountDTO(Long accountId, Long userId, String accountNumber, String accountType, Long balance, Date createdDate) {
        this.accountId = accountId;
        this.userId = userId;
        this.accountNumber = accountNumber;
        this.accountType = accountType;
        this.balance = balance;
        this.createdDate = createdDate;
    }

    // Getters and Setters
    public Long getAccountId() {
        return accountId;
    }

    public void setAccountId(Long accountId) {
        this.accountId = accountId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public Long getBalance() {
        return balance;
    }

    public void setBalance(Long balance) {
        this.balance = balance;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public String toString() {
        return "AccountDTO{" +
                "accountId=" + accountId +
                ", userId=" + userId +
                ", accountNumber='" + accountNumber + '\'' +
                ", accountType='" + accountType + '\'' +
                ", balance=" + balance +
                ", createdDate=" + createdDate +
                '}';
    }
}
