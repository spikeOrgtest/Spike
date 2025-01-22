package com.spike.dto;

import java.time.LocalDate;

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

@Getter
@Setter
@Entity
@SequenceGenerator(	
		name = "card_seq_generator", 
		sequenceName = "card_seq", 
		initialValue = 1,
		allocationSize = 1)

@Table(name = "Card")
public class CardDTO {
	
	@Id
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "card_no_seq"
			)
	
	private Integer card_id;
	
	@ManyToOne
	private UserDTO owner;
	
	private String card_name;
	
	private String card_number;
	
	private String card_password;
	
	private String Overseas_payment;
	
	private String transportation_card;
	
	@CreationTimestamp
	@Column(columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
	private LocalDate created_date;
	
}
