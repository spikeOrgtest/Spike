package com.spike.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "Transaction")
public class TransactionDTO {

	@Id
	@SequenceGenerator(
			name = "Transaction_seq_generator",
			sequenceName = "Transaction_seq",
			initialValue = 1,
			allocationSize = 1
			
			)
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "Transaction_seq_generator"
			
			)
	private long id;
	
	@ManyToOne
	private AccountTestDTO fromAccount; //@manyToOne에 의해 컬럼명이 자동으로 from_account_id로 생성 -> joincolumn 어노테이션 사용할 필요 x
	
	@ManyToOne
	private AccountTestDTO toAccount;
	
	private BigDecimal amount;
	
	private String transactionType;
	
	private String status = "PENDING"; //기본값 pending으로 지정
	
	private String memo; //이체 메모
	
	@CreationTimestamp
	//@Column(updatable = false) 자동 업데이트는 되지 않지만 update는 가능한 상태, 가능성 배제 위해 updatable 설정 고려
	private Timestamp transactionDate;
	
	
}
