package com.spike.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "Account")
public class Account {
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "account_seq_generator")
	@SequenceGenerator(name = "account_seq_generator", sequenceName = "accounts_seq", allocationSize = 1)
	@Id
	private Long id;
    private String name;
    private String ssn;
    private String email;
    private String password;

}
