package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	@Override
	public Page<CheatReportDTO> findByreportValue(String detailValue, int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Order.asc("reportId"))); // reportId 기준으로 오름차순 정렬
		return this.cheatreportRepo.findByreportValue(detailValue, pageable);
	}

	@Override
	public Page<CheatReportDTO> findByCheatList(int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Order.asc("reportId")));
		return this.cheatreportRepo.findByCheatList(pageable);
	}

	@Override
	public void updateStatus(String status, Long reportId) {
		this.cheatreportRepo.updateStatus(status, reportId);
	}

}
