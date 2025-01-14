package com.spike.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;

public interface NoticeRepository extends JpaRepository<NoticeDTO, Long > {
    
	@Query("select count(*) from NoticeDTO ")
	int nCount(NoticeDTO notice, NotiPageDTO p);
	

}
