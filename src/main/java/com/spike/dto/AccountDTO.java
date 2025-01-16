package com.spike.dto;

import java.sql.Timestamp;
import java.time.LocalDate;

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
@Entity
@SequenceGenerator(	
		name = "account_seq_generator", 
		sequenceName = "accounts_seq", 
		initialValue = 1,
		allocationSize = 1)

@Table(name = "Account")
public class AccountDTO {
	
	@Id
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "account_no_seq"
			)
	private long account_id;
	
	private long user_id;
	
	private String account_type;
	
	private String account_number;
	
	private String account_password;
	
	private String balance;
	
	private Timestamp created_date;
	
	private LocalDate update_date;
	
}
