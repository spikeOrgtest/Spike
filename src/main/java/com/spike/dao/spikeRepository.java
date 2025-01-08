package com.spike.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.spikeDTO;

public interface spikeRepository extends JpaRepository<spikeDTO, Integer> {

	
}
