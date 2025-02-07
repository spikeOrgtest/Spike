package com.spike.repository;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.CheatReportDTO;

public interface CheatReportRepository extends JpaRepository<CheatReportDTO, Long> {

	Page<CheatReportDTO> findByreportValue(String detailValue, Pageable pageable);

}
