package com.spike.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "STOCK")
public class StockDTO {
	
	@Id
	@SequenceGenerator(
			name = "Stock_seq_generator",
			sequenceName = "Stock_id_seq",
			initialValue = 1,
			allocationSize = 1
			)
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "Stock_seq_generator"
			)
    private int stockId;
	
	//stockCode도 시퀀스로 구현
	@SequenceGenerator(
			name = "Stock_code_generator",
			sequenceName = "Stock_id_seq",
			initialValue = 1,
			allocationSize = 1
			)
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "Stock_seq_generator"
			)
    private String stockCode; // 새로운 필드 추가
	
	
    private String companyName; //제약조건 나중에 주는걸로
    
    private String tickerSymbol;
    
    private String sector;
    
    private double initialPrice;
    
    private double currentPrice;
    
    private int totalShares;
    
    private int availableShares;
    
    private int isActive = 1; //String status면 좋겠는데 기존 코드랑 충돌위험, 보류
    
    private Timestamp createdDate;

    
}
