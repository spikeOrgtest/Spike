package com.spike.service;

import java.util.List;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;

public interface NoticeService {

	void insertnotice(NoticeDTO notice);

	int getRowCount(NotiPageDTO p);

	List<NoticeDTO> getNotiList(NotiPageDTO p);


}
