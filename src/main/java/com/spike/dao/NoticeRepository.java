package com.spike.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.NoticeDTO;

public interface NoticeRepository extends JpaRepository<NoticeDTO, String > {

}
