package com.spike.dto;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity
@Table(name = "loginHistory")
@SequenceGenerator(
		name = "login_his_seq", //시퀀스 제네레이터 이름
		sequenceName = "loginhis_seq", // 시퀀스 이름
		initialValue =  1,//시작값
		allocationSize = 1 //증가값
		)

public class ManagerDTO {

	 @Id
	 @GeneratedValue(strategy = GenerationType.SEQUENCE, //사용할 전략을 시퀀스로
	                 generator = "login_his_seq") //시퀀스 생성기에서 설정한 시퀀스 제너레이터 이름
	 private Integer logNo;
	 
	 @ManyToOne(fetch = FetchType.LAZY)
	 @JoinColumn(name = "userId")
	 private UserDTO logHis;
	 
	 private LocalDateTime allTime;
	 
}
