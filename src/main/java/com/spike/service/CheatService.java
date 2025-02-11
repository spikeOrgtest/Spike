package com.spike.service;

import org.springframework.data.domain.Page;

import com.spike.dto.CheatReportDTO;

public interface CheatService {

	void saveContent(CheatReportDTO cr);

	Page<CheatReportDTO> findByreportValue(String detailValue, int page, int size);

	Page<CheatReportDTO> findByCheatList(int page, int size);

	void updateStatus(String status, Long reportId);

}
