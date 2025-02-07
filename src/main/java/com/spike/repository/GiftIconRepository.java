package com.spike.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.GiftIconDTO;

public interface GiftIconRepository extends JpaRepository<GiftIconDTO, Long> {

//	@Query("select g from GiftIconDTO g where")
//	List<GiftIconDTO> findgiftion();

	
}
