package com.spike.service;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;

public interface NoticeService {

	void insertnotice(NoticeDTO notice);

	int getRowCount(NotiPageDTO p);


}
