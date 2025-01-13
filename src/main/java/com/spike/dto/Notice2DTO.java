package com.spike.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Notice2DTO {

    private MultipartFile uploadFile; // 파일을 받을 필드

}