package com.spike.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private NoticeRepository NoticeRepo;
	
	@Override
	public void insertNotice(NoticeDTO notice) {
		System.out.println(" Notice 시퀀스 저장");
		this.NoticeRepo.save(notice);
	}

	@Override
	public int getRowCount(NoticeDTO notice, NotiPageDTO p) {
		return this.NoticeRepo.nCount(notice,p);
	}



}
