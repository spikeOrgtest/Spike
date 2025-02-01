package com.spike.dto;

import java.time.LocalDate;

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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@SequenceGenerator(name = "account_seq_generator", sequenceName = "account_no_seq", initialValue = 1, allocationSize = 1)

@Table(name = "Account")
public class AccountDTO {
      @Id
      @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "account_seq_generator")

      private long account_id;

      @ManyToOne(fetch = FetchType.LAZY)
      @JoinColumn(name = "user_id")
      private UserDTO owner;

      private String account_type;

      private String account_number;

      private String account_password;

      private Long one_limit;

      private Long day_limit;

      private Long balance;

      @CreationTimestamp
      @Column(columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
      private LocalDate created_date;

      private LocalDate update_date;

      private Double interestRate = 4.0; // 기본 금리 4.0%로 설정
      
      @Column(name = "bonus_rate")
      private Double bonusRate = 2.0; // 우대 금리 2.0%로 설정
      
      @Column(name = "total_rate")
      private Double totalRate; // 총 금리 (기본금리 + 우대금리)

      private LocalDate lastInterestDate; // 마지막 이자 계산일
      
      private LocalDate startDate; // 계좌 시작일

      private boolean deleted = false;  // 계좌 삭제 여부

      @PrePersist // DB 저장 전
      @PreUpdate // DB 수정 전
      public void calculateTotalRate() {
          if (account_type != null) {
              switch (account_type) {
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
