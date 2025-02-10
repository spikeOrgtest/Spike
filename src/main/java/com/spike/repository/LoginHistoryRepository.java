package com.spike.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.ManagerDTO;


@Repository
public interface LoginHistoryRepository extends JpaRepository<ManagerDTO, Integer> {
    
	@Query("select u from ManagerDTO u where u.logHis.userId=?1 ORDER BY u.allTime DESC")
	Page<ManagerDTO> findByLoginIdday(Long UserId, Pageable pageable);

}
