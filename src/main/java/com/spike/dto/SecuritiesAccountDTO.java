package com.spike.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "securities_account")
public class SecuritiesAccountDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_account_id")
    @SequenceGenerator(name = "seq_account_id", sequenceName = "SEQ_ACCOUNT_ID", allocationSize = 1)
    @Column(name = "account_id", nullable = false)
    private Long accountId;

    @Column(name = "user_id", nullable = false)
    private Long userId; // user_info 테이블의 외래 키

    @Column(name = "account_number", unique = true, nullable = false, length = 255)
    private String accountNumber;

    @Column(name = "balance", nullable = false)
    private Double balance = 0.0;

    @Column(name = "currency", nullable = false, length = 10)
    private String currency = "USD";

    @Column(name = "status", nullable = false, length = 20)
    private String status = "Active";

    @Column(name = "created_date", nullable = false)
    private LocalDateTime createdDate = LocalDateTime.now();
}
