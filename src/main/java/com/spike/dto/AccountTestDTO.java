package com.spike.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "ACCOUNT")
public class AccountTestDTO {

    @Id
    @SequenceGenerator(
        name = "ACCOUNT_SEQ_GENERATOR",       // 시퀀스 제네레이터 이름
        sequenceName = "ACCOUNT_SEQ",         // 실제 DB 시퀀스 이름
        initialValue = 1,                     // 시작 값 (옵션)
        allocationSize = 1                    // 시퀀스 한 번 호출 시 증가하는 수(옵션)
    )
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "ACCOUNT_SEQ_GENERATOR"
    )
    private Long id;

    // 다른 팀원이 만든 User 엔티티가 있다고 가정 (PK = Long)
    @ManyToOne
    private UserDTO user_id;

    @Column(name = "ACCOUNT_NUMBER", nullable = false, unique = true)
    private String accountNumber;

    // 계좌 잔액
    @Column(nullable = false)
    private BigDecimal balance = BigDecimal.ZERO;

    // 계좌 타입 (예: "DEPOSIT", "SAVING", "LOAN", "STOCK", "CRYPTO", etc.)
    // enum 대신 String으로 관리
    @Column(name = "ACCOUNT_TYPE", nullable = false)
    private String accountType;

    // 통화 단위 (기본값 KRW)
    @Column(name = "CURRENCY", nullable = false)
    private String currency = "KRW";

    // 생성 시각
    @CreatedDate
    @Column(name = "CREATED_AT", updatable = false)
    private LocalDateTime createdAt;

    // 마지막 수정 시각
    @LastModifiedDate
    @Column(name = "UPDATED_AT")
    private LocalDateTime updatedAt;

   
}