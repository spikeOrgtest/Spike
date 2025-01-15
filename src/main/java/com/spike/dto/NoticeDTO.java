package com.spike.dto;


import java.sql.Timestamp;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="Notice")
@SequenceGenerator(//시퀀스 생성기
		name = "notice_no_seq", //시퀀스 제네레이터 이름
		sequenceName = "notice_seq", // 시퀀스 이름
		initialValue =  1,//시작값
		allocationSize = 1 //증가값
		)

public class NoticeDTO {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, //사용할 전략을 시퀀스로 선택
	                generator ="notice_no_seq") //시퀀스 생성기에서 설정한 시퀀스 제너레이터 이름
	private Long notice_id;
	
	
	@Column(length = 50)
	private String notice_name;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String title;
	
	@NotNull(message = "내용을 입력해주세요.")
	@Column(length = 2000)
	private String content;
	
	//@NotNull
	//@Column(length = 100)
	//private String author;
	
	@UpdateTimestamp
	private LocalDate updated_date;
	
	@CreationTimestamp  // 하이버네이트의 특별한 기능으로 등록시점의 날짜값을 기록
	private Timestamp created_date; // 등록날짜
	
    @Column(length=4000)
    private String notice_file; //첨부파일 경로와 파일명
    

}
