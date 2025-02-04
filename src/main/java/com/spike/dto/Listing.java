package com.spike.dto;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

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
	
	@ManyToOne //판매자 계좌 참조
	@JoinColumn(nullable = false) //기본값은 true, 명시적으로 지정해 주는게 좋을듯(데이터 무결성)
	private SecuritiesAccountDTO seller;
	
	//판매하는 주식의 종류(FK로 참조), 양, 가격
	@ManyToOne
	private Stock stock;
	
	private int quantity;
	
	private int price;
	
	//매물이 시장에 나온 시점
	@CreationTimestamp
	private Timestamp listedAt;

}
