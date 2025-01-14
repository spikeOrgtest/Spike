package com.spike.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.SequenceGenerator;
import javax.persistence.Column;
import java.util.Date;

@Entity
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "account_seq_generator")
    @SequenceGenerator(name = "account_seq_generator", sequenceName = "account_seq", allocationSize = 1)
    private int accountId;  // 계좌 ID (기본 키)

    private int userId;  // 사용자 ID (외래 키)

    @Column(nullable = false, unique = true)
    private String accountNumber;  // 계좌 번호 (고유)

    private String accountType;  // 계좌 종류 (예: 예금, 적금, 대출)

    @Column(nullable = false)
    private double balance;  // 잔액

    @Column(nullable = false)
    private Date createdDate;  // 계좌 생성 날짜

    public Account(String accountNumber, String accountType, double balance, int userId, Date createdDate) {
        this.accountNumber = accountNumber;
        this.accountType = accountType;
        this.balance = balance;
        this.userId = userId;
        this.createdDate = createdDate;
    }

    // 기본 생성자 추가
    public Account() {}

    // Getter 및 Setter

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
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

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
}
