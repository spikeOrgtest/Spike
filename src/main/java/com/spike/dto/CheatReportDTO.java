package com.spike.dto;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@SequenceGenerator(name="cheatreport_no_seq_name", sequenceName="cheatreport_no_seq", initialValue = 1, allocationSize = 1)
@Table(name = "CheatReport")
public class CheatReportDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cheatreport_no_seq")
	private Long reportId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="accountId")
	private AccountDTO accountId;
	
	@CreationTimestamp
	private LocalDateTime reportDate;
	
	@NotNull
	@Column(length = 1000)
	private String content;
	
	@NotNull
	private String reportType;
	
	@NotNull
	private String reportValue;
	
	private Long cnt;
	
	private String status;
}
