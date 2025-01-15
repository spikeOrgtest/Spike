package com.spike.dao;

import java.util.List;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;

public interface NoticeDAO {

	void insertNotice(NoticeDTO notice);

	int getRowCount(NotiPageDTO p);

	List<NoticeDTO> getNotiList(NotiPageDTO p);

	void updateHit(Long notice_no);

	NoticeDTO getNoti_cont(Long notice_no);

	void editNoti(NoticeDTO notice);

	void delNoti(Long notice_no);


}
