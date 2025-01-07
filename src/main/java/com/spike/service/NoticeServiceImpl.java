package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.NoticeDAO;
import com.spike.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void insertnotice(NoticeDTO notice) {
		this.noticeDAO.insertNotice(notice);
	}

}
