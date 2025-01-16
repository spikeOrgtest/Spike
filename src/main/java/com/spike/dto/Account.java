//package com.spike.dto;
//
//import java.sql.Timestamp;
//
//import javax.persistence.Entity;
//import javax.persistence.SequenceGenerator;
//import javax.persistence.Table;
//
//import org.hibernate.annotations.CreationTimestamp;
//
//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;
//
//@Setter
//@Getter
//@ToString
//@Entity
//@SequenceGenerator(
//		name = "account_no_seq",
//		sequenceName ="account_no_seq",
//		initialValue = 1,
//		allocationSize = 1
//		)
//
//@Table(name = "Account")
//public class Account {
//	
//	private Long accountId; // 계좌ID
//	private String userId; // 사용자ID
//	private String accountNumber; // 계좌번호
//	private Long accountType; // 계좌 유형
//	private Long balance; // 잔액
//	private Long dailyLimit; // 일일 한도 금액
//	private Long sendLimit; // 일회 한도 금액
//	
//	@CreationTimestamp
//	private Timestamp accountDate; // 계좌 생성날짜
//	@CreationTimestamp
//	private Timestamp accountUpdate; // 계좌 업데이트 날짜
//
//}
