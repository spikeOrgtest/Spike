package com.spike.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private NoticeRepository NoticeRepo;
	
	@Override
	public void insertNotice(NoticeDTO notice) {
		System.out.println(" Notice 시퀀스 저장");
		
		this.NoticeRepo.save(notice);
	}

	@Override
	public int getRowCount(NotiPageDTO p) {
		return this.sqlSession.selectOne("noti_count", p);
	}

	@Override
	public List<NoticeDTO> getNotiList(NotiPageDTO p) {
		return this.sqlSession.selectList("noti_list",p);
	}

}
