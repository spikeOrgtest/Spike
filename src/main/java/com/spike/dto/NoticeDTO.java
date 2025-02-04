package com.spike.dto;


import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

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
	private Long noticeNo; // id를 no로 변경
	
	
	@Column(length = 50)
	private String noticeName; // 글쓴이
	
	//@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String noticeTitle; // 글제목
	
	//@NotNull(message = "내용을 입력해주세요.")
	@Column(length = 2000)
	private String noticeCont; // 글내용
	
	//@NotNull
	//@Column(length = 100)
	//private String author;
	
	
	private int noticeHit; // 조회수
	
	//답변글과 관련된 부분
	//private int notice_ref; // 글그룹번호
	//private int notice_step;  // ! 필요없을수도 있음 !
	//private int notice_level; // 답변글 정렬순서  ! 필요없을수도 있음 !
	
	
	@CreationTimestamp  // 하이버네이트의 특별한 기능으로 등록시점의 날짜값을 기록
	private Timestamp createdDate; // 등록날짜
	
	@UpdateTimestamp
	private LocalDate updatedDate;
	
	
    @Column(length=4000)
    private String noticeFile; //첨부파일 경로와 파일명
    

}
