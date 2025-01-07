package com.spike.dto;

import java.security.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.validation.constraints.*;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="Notice")


public class NoticeDTO {
	
	@Id
	private String notice_id;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String title;
	
	@NotNull(message = "내용을 입력해주세요.")
	@Column(length = 2000)
	private String content;
	
	@NotNull
	@Column(length = 100)
	private String author;
	
	@UpdateTimestamp
	private LocalDate updated_date;
	
	
	@Column(name = "created_date", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
	private Timestamp created_date;

}
