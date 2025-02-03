package com.spike.dto;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder //생성자 메서드 대신 builder로 생성 -> 나머지는 초기값
public class TransferHistoryDTO {
	
	private final String name; 
    private final Timestamp transactionDate; 
    private final long amount; 
    private final long afterBalance; 
    
    //마이페이지에서는 계좌번호도 보여줘야 할 것
    private final String fromAccount; 
    private final String toAccount;
}
