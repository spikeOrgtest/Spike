package com.spike.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.NoticeDTO;

public interface NoticeRepository extends JpaRepository<NoticeDTO, Long > {
    
	@Modifying
	@Query("update NoticeDTO n set n.notice_level=n.notice_level+1 where n.notice_ref=?1 and n.notice_level > ?2")
	public void updateLevel(int ref, int level);

	@Modifying
	@Query("update NoticeDTO n set n.notice_name=?1, notice_title=?2, notice_cont=?3, notice_file=?4 where n.notice_no=?5")
	public void updateNoti(String name, String title , String cont, String file, Long notice_no);
}
