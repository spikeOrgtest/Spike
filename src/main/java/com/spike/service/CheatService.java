package com.spike.service;

import com.spike.dto.CheatDetaliDTO;
import com.spike.dto.CheatReportDTO;

public interface CheatService {

	void saveContent(CheatReportDTO cr);

	void saveDetail(CheatDetaliDTO cd);

}
