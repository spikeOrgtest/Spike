package com.spike.dto;

import java.math.BigDecimal;

import javax.persistence.Entity;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class SampleBasicAccount extends AccountTestDTO {
	private String accountPwd;
	public SampleBasicAccount() {
        this.setAccountType("기본입출금계좌"); // 부모 클래스의 필드를 직접 초기화
        this.setBalance(BigDecimal.valueOf(1000000));
    }
}
