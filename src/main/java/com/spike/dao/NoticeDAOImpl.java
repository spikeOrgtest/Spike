package com.spike.dao;

import java.util.List;
import java.util.Optional;

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
		
		 //sqlSession.insert("notice.insertNotice", notice);
		System.out.println(" Notice 시퀀스 저장");
		//int notiseq_no = this.NoticeRepo.getCurrentSequenceValue();//오토언박싱 해서 시퀀스 현재번호값을 구하기.
	    //notice.setNotice_no((long)notiseq_no);
		//notice.setNotice_ref(notiseq_no);
		
		this.NoticeRepo.save(notice);
	}

	@Override
	public int getRowCount(NotiPageDTO p) {
		return this.sqlSession.selectOne("noti_count", p);
	}

	@Override
	public List<NoticeDTO> getNotiList(NotiPageDTO p) {
		System.out.println(p.getFindField());
		System.out.println(p.getFindName());
		
		return this.sqlSession.selectList("noti_list",p);
		
	}
	
	@Override
	public void updateHit(Long notice_no) {
		System.out.println("jpa");
		Optional<NoticeDTO> notice_hit = this.NoticeRepo.findById(notice_no); // 레코드검색
		
		notice_hit.ifPresent(notice_hit2 -> {
			notice_hit2.setNoticeHit(notice_hit2.getNoticeHit()+1); //조회수 1 증가
			this.NoticeRepo.save(notice_hit2);
		});
	} // 조회수 증가

	@Override
	public NoticeDTO getNoti_cont(Long notice_no) {
		System.out.println("jpatttt");
		NoticeDTO nt = this.NoticeRepo.getReferenceById(notice_no);
		return nt;
	}//내용보기

	@Override
	public void editNoti(NoticeDTO notice) {
		System.out.println("jpa");
		this.NoticeRepo.updateNoti(notice.getNoticeName(), notice.getNoticeTitle(), notice.getNoticeCont(), 
				notice.getNoticeFile(),notice.getNoticeNo());
	}//자료실수정

	@Override
	public void delNoti(Long notice_no) {
		System.out.println("jpa");
		this.NoticeRepo.deleteById(notice_no);
	}//자료실삭제

}
