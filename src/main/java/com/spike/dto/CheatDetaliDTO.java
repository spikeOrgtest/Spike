package com.spike.dto;

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

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
@SequenceGenerator(name="cheatdetail_no_seq_name", sequenceName="cheatdetail_no_seq", initialValue = 1, allocationSize = 1)
@Table(name = "CheatDetail")
public class CheatDetaliDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "cheatdetail_no_seq")
	private Long detailId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name ="reportId")
	private CheatReportDTO reporterId;
	
	@NotNull
	private String detailType;
	
	@NotNull
	private String detailValue;
	
	private Long cont;
}
