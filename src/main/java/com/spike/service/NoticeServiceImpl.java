package com.spike.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.NoticeDAO;
import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Transactional
	@Override
	public void insertnotice(NoticeDTO notice) {
		this.noticeDAO.insertNotice(notice);
	}

	@Override
	public int getRowCount(NotiPageDTO p) {
		return this.noticeDAO.getRowCount(p);
	}

	@Override
	public List<NoticeDTO> getNotiList(NotiPageDTO p) {
		return this.noticeDAO.getNotiList(p);
	}



}
