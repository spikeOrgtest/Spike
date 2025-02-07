package com.spike.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "StockHolding")
@SequenceGenerator(
    name = "Stockholding_seq_generator",
    sequenceName = "Stockholding_seq",
    initialValue = 1,
    allocationSize = 1
)
public class StockHolding {

	@Id
	@GeneratedValue(
			generator = "Stockholding_seq_generator",
			strategy = GenerationType.SEQUENCE
			)
	private int id;
	
	@ManyToOne
	private SecuritiesAccountDTO holder;
	
	@ManyToOne
	private StockDTO stock;
	
	private int quantity;
	
}
