package com.spike.dto;


import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name="Quiz") //테이블 생성
@EqualsAndHashCode(of="quiz_id")

public class QuizDTO {
	
	@Id //구분키
	private int quiz_id; //퀴즈 식별 번호 
	
	private String question; //퀴즈 질문
	private String correct_answer; //정답, 오답 표시
	private int points;
	
	@CreationTimestamp
	private  Timestamp last_attempt_date; //마지막 퀴즈 도전 날짜
	
}
