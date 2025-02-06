package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dto.CheatDetaliDTO;
import com.spike.dto.CheatReportDTO;
import com.spike.repository.CheatDetailRepository;
import com.spike.repository.CheatReportRepository;

@Service
public class CheatReportServiceImpl implements CheatService {

	@Autowired
	private CheatReportRepository cheatreportRepo;
	
	@Autowired
	private CheatDetailRepository cheatdetailRepo;

	@Override
	public void saveContent(CheatReportDTO cr) {
		this.cheatreportRepo.save(cr);
	}

	@Override
	public void saveDetail(CheatDetaliDTO cd) {
		this.cheatdetailRepo.save(cd);
	}
	
}
