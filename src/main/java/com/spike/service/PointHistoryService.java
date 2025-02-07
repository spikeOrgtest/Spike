package com.spike.service;


import com.spike.dto.PointHistoryDTO;
import com.spike.repository.PointHistoryRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointHistoryService {

    @Autowired
    private PointHistoryRepository pointHistoryRepository;  // 포인트 사용 내역 저장소

	public List<PointHistoryDTO> findhistory() {
		return null;
	}

	

}