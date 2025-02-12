package com.spike.dto;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@Entity
@SequenceGenerator(name = "account_seq_generator", sequenceName = "account_no_seq", initialValue = 1, allocationSize = 1)

@Table(name = "Account")
public class AccountDTO {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "account_seq_generator")

	private Long accountId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private UserDTO owner;

	private String accountType;

	private String productType;

	private String accountNumber;

	private String accountPassword;

	private Long oneLimit;

	private Long dayLimit;

	private Long availableLimit;

	@Column(name = "balance")
	private Long balance; // 잔액 필드

	@CreationTimestamp
	@Column(name = "created_date")
	private Date createdDate;

	@Column(name = "interest_rate")
	private Double interestRate = 4.0; // 기본 금리 4.0%로 설정

	@Column(name = "bonus_rate")
	private Double bonusRate = 2.0; // 우대 금리 2.0%로 설정

	@Column(name = "total_rate")
	private Double totalRate; // 총 금리 (기본금리 + 우대금리)

	@Column(name = "last_interest_date")
	private Date lastInterestDate; // 마지막 이자 계산일

	@Column(name = "start_date")
	private Date startDate;

	@Column(name = "account_state")
	private String accountState = "ACTIVE"; // 기본값 설정

	private Long interestAmount; // 발생한 이자 금액

	private Long loanPrincipal; // 대출 원금 (대출 계좌인 경우)

	@PrePersist // DB 저장 전
	public void prePersist() {
		// 기존 이자율 계산
		calculateTotalRate();

		// 계좌 상태 초기화
		if (accountState == null) {
			accountState = "ACTIVE";
		}

		// 생성일자가 없으면 현재 시간으로
		if (lastInterestDate == null) {
			lastInterestDate = new Date();
		}
	}

	public void calculateTotalRate() {
		if (accountType != null) {
			switch (accountType) {
				case "예금":
					interestRate = 4.0;
					bonusRate = 2.0;
					break;
				case "적금":
					interestRate = 3.5;
					bonusRate = 2.5;
					break;
				case "대출":
					interestRate = 5.0;
					bonusRate = 2.0;
					break;
			}
		}
		this.totalRate = this.interestRate + this.bonusRate;
	}
}
