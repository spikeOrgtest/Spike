package com.spike.dao;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;

public interface NoticeDAO {

	void insertNotice(NoticeDTO notice);

	int getRowCount(NoticeDTO notice, NotiPageDTO p);

}
