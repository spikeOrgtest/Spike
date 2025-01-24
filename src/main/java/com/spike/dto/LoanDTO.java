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
		name = "loan_seq_generator", 
		sequenceName = "loan_seq", 
		initialValue = 1,
		allocationSize = 1)

@Table(name = "Loan")
public class LoanDTO {
	
	@Id
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "loan_no_seq"
			)
	
	private Integer loan_id;
	
	@ManyToOne
	private UserDTO owner;
	
	private String loan_name;
	
	@CreationTimestamp
	@Column(columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
	private LocalDate created_date;
	
}
