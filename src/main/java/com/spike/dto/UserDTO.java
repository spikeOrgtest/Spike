package com.spike.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.*;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@Entity
@SequenceGenerator(
		name = "user_no_seq_name",
		sequenceName = "user_no_seq",
		initialValue = 1,
		allocationSize = 1
		)
@Table(name="UserInfo")
@EqualsAndHashCode(of="user_id")
public class UserDTO {
	
	@Id
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "user_no_seq_name"
			)
	private Integer user_id;
	
	@NotNull
	@Column(length = 100)
	private String login_id;
	
	@NotNull
	@Column(length = 255)
	private String password;
	
	@NotNull
	@Column(length = 100)
	private String name;
	
	@NotNull
	@Column(length = 255)
	private String email_id;
	
	@NotNull
	@Column(length = 255)
	private String email_domain;
	
	@NotNull
	@Column(length = 15)
	private String phone;
	
	@NotNull
	@Column(length = 15)
	private String phone01;
	
	@NotNull
	@Column(length = 15)
	private String phone02;
	
	@NotNull
	@Column(length = 15)
	private String phone03;

	@NotNull
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth_date;
	
	@NotNull
	@Column(length = 255)
	private String postcode;
	
	@NotNull
	@Column(length = 255)
	private String roadAddress;
	
	@Column(length = 255)
	private String jibunAddress;
	
	@NotNull
	@Column(length = 100)
	private String detailAddress;
	
	private String profile_image_uri;

	@Transient // DB에 저장되지 않도록 처리해주는 에노테이션
	private MultipartFile profileImage;
	
	private String is_minor;
	
    private String status;
	
	private LocalDateTime last_login; // 마지막 로그인
	
	@CreationTimestamp
	@Column(name = "registration_date", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
	private LocalDateTime registration_date;
	
    
}
