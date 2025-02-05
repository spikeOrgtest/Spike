package com.spike.dto;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@Table(name = "StockTransaction")
public class StockTransaction {

	@Id
	@SequenceGenerator(
			name = "StockTransaction_seq_generator",
			sequenceName = "StockTransaction_seq",
			initialValue = 1,
			allocationSize = 1
			)
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "StockTransaction_seq_generator"
			)
	private int id;
	
	@ManyToOne
    @JoinColumn(nullable = false)
    private SecuritiesAccountDTO seller; 

    @ManyToOne
    @JoinColumn(nullable = false)
    private SecuritiesAccountDTO buyer;

    @ManyToOne
    @JoinColumn(nullable = false)
    private StockDTO stock;

    private int quantity;

    private long price;

    @CreationTimestamp
    private Timestamp transactionTime;
}
