package com.spike.dto;

import javax.persistence.Entity;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class NotiPageDTO {

	//페이징 (쪽나누기) 관련 변수
	private int startrow;// 시작행 번호
	private int endroe;//끝행 번호
	
	//검색 관련변수
	private String find_field; // 검색필드
	private String find_name; // 검색어
}
