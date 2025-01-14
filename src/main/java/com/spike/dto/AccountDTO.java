package com.spike.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor  // 기본 생성자 추가
public class AccountDTO {

    private int accountId;  // 계좌 ID
    private String accountNumber;  // 계좌 번호
    private String accountType;  // 계좌 종류
    private double balance;  // 잔액
    private int userId;  // 사용자 ID
    private Date createdDate;  // 계좌 생성 날짜

    // 생성자 추가
    public AccountDTO(String accountNumber, String accountType, double balance, int userId, Date createdDate) {
        this.accountNumber = accountNumber;
        this.accountType = accountType;
        this.balance = balance;
        this.userId = userId;
        this.createdDate = createdDate;
    }
}
