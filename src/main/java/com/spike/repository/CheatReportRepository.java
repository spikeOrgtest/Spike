package com.spike.repository;


import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.CheatReportDTO;

public interface CheatReportRepository extends JpaRepository<CheatReportDTO, Long> {

	Page<CheatReportDTO> findByreportValue(String detailValue, Pageable pageable);

	@Query("select c from CheatReportDTO c")
	Page<CheatReportDTO> findByCheatList(Pageable pageable);

	@Modifying
	@Transactional
	@Query("update CheatReportDTO c set c.status=?1 where c.reportId=?2")
	void updateStatus(String status, Long reportId);

	@Modifying
	@Transactional
	@Query("delete from CheatReportDTO c where c.accountId.accountId=?1")
	void CheatDelete(Long accountId);

}
