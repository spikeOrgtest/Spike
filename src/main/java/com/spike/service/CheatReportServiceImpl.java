package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dto.CheatReportDTO;
import com.spike.repository.CheatReportRepository;

@Service
public class CheatReportServiceImpl implements CheatService {

	@Autowired
	private CheatReportRepository cheatreportRepo;
	

	@Override
	public void saveContent(CheatReportDTO cr) {
		this.cheatreportRepo.save(cr);
	}

}
