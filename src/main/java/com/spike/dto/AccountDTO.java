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

import org.hibernate.annotations.CreationTimestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@SequenceGenerator(   
      name = "account_seq_generator", 
      sequenceName = "account_no_seq", 
      initialValue = 1,
      allocationSize = 1)

@Table(name = "Account")
public class AccountDTO {   
   @Id
   @GeneratedValue(
         strategy = GenerationType.SEQUENCE,
         generator = "account_seq_generator"
         )
   
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
   
}
