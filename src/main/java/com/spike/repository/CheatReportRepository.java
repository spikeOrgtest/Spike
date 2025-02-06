package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.CheatReportDTO;

public interface CheatReportRepository extends JpaRepository<CheatReportDTO, Long> {

}
