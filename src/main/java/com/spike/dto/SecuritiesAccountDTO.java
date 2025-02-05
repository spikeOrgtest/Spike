package com.spike.dto;

import lombok.Getter;

import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "securities_account")
public class SecuritiesAccountDTO {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_account_id")
	@SequenceGenerator(name = "seq_account_id", sequenceName = "SEQ_ACCOUNT_ID", allocationSize = 1)
	private Long accountId;

	@Column(name = "account_number", unique = true, nullable = false, length = 255)
	private String accountNumber;

	@Column(name = "balance", nullable = false)
	private long balance = 0;

	@Column(name = "currency", nullable = false, length = 10)
	private String currency = "KRW";

	@Column(name = "status", nullable = false, length = 20)
	private String status = "Active";

	@Column(name = "created_date", nullable = false)
	private LocalDateTime createdDate = LocalDateTime.now();

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	private UserDTO user;

	@Column(name = "account_password", nullable = false, length = 255)
	private String accountPassword;

	@Transient
	private long initialDeposit;

	public void setInitialDeposit(long initialDeposit) {
		this.initialDeposit = initialDeposit;
		if (initialDeposit != 0) {
			this.balance = initialDeposit;
		}
	}

	// 계좌 번호 생성 메서드
	public void generateAccountNumber() {
		this.accountNumber = "ACC-" + UUID.randomUUID().toString().substring(0, 10).toUpperCase();
	}

	// 비밀번호 검증 메서드 (암호화 전에 호출해야 함)
	public void validatePassword(String accountPassword) {
		if (accountPassword == null || !accountPassword.matches("\\d{6}")) {
			throw new IllegalArgumentException("비밀번호는 6자리 숫자여야 합니다.");
		}
	}

	// 검증 후 암호화까지 포함한 메서드 추가!!!!
	public void validateAndSetAccountPassword(String accountPassword, PasswordEncoder passwordEncoder) {
		validatePassword(accountPassword); // 검증 먼저 수행
		this.accountPassword = passwordEncoder.encode(accountPassword); //  암호화된 값 저장!!!!
	}

	
}
