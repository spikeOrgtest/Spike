package com.spike.dto;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "STOCK")
public class Stock {
	
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
	
	
    private String stockCode; // 새로운 필드 추가
	
	
    private String companyName; //제약조건 나중에 주는걸로
    
    private String tickerSymbol;
    
    private String sector;
    
    private double initialPrice;
    
    private double currentPrice;
    
    private int totalShares;
    
    private int availableShares; 
    
    @Column(nullable = true)
    private int isActive = 1; //String status면 좋겠는데 기존 코드랑 충돌위험, 보류
    
    private Timestamp createdDate;

    //트리거 대신 prepersist 어노테이션으로 똑같은 기능 구현, pre(이전)persist(insert)
    //stockId는 생성시 시퀀스가 지정해주니 트리거 필요x 
    @PrePersist
    public void generateStockCode() {
        if (this.stockCode == null) {
            this.stockCode = String.format("%08d", this.stockId);
        }
    }
}
