package com.spike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeDTO getNoticeCont(Long notice_no) {
		this.noticeDAO.updateHit(notice_no);
		NoticeDTO nt = this.noticeDAO.getNoti_cont(notice_no);
		return nt;
	}

	@Override
	public NoticeDTO getNoticeCont2(Long notice_no) {
		return this.noticeDAO.getNoti_cont(notice_no);
	}

	@Override
	public void editNoti(NoticeDTO notice) {
		this.noticeDAO.editNoti(notice);
		
	}

	@Override
	public void delNoti(Long notice_no) {
		this.noticeDAO.delNoti(notice_no);
		
	}



}
