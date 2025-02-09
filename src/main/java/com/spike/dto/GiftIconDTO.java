package com.spike.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@SequenceGenerator(name = "gift_no_seq_name", sequenceName = "gift_no_seq", initialValue = 1, allocationSize = 1)
@Entity
@Table(name="GiftIcon")
public class GiftIconDTO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gift_no_seq_name" )
	private Long giftIconId;
	
	@Column(length = 225, nullable = false)
	private String giftconName;
	
	@Column(length = 225, nullable = false)
	private Long price; 
	
}

