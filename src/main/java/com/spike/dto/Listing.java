package com.spike.dto;

import java.sql.Timestamp;
import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@SequenceGenerator(
    name = "Listing_seq_generator",
    sequenceName = "Listing_seq",
    initialValue = 1,
    allocationSize = 1
)
public class Listing {

    @Id
    @GeneratedValue(
        generator = "Listing_seq_generator",
        strategy = GenerationType.SEQUENCE
    )
    private int id;

    @ManyToOne
    @JoinColumn(nullable = false) // 판매자의 증권 계좌 
    private SecuritiesAccountDTO seller;

    @ManyToOne
    @JoinColumn(nullable = false) // 판매하는 주식 정보
    private StockDTO stock;

    @Column(nullable = false)
    private int quantity; // 판매 수량

    @Column(nullable = false)
    private int price; // 판매 가격 

    @CreationTimestamp
    private Timestamp listedAt; // 매물 등록 시간 

    
}
