package com.spike.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.ManagerDTO;


@Repository
public interface LoginHistoryRepository extends JpaRepository<ManagerDTO, Long> {

	@Modifying
	@Transactional
	@Query("delete from ManagerDTO m where m.logHis.userId=?1")
	void historyDelete(Long userId);
    //List<ManagerDTO> findByLogHis_LoginIdOrderByAllTimeDesc(String loginId);
    //@Query("SELECT l FROM LoginHistory l WHERE l.loginId = :loginId")
    //List<ManagerDTO> findLoginHistory(@Param("loginId") String loginId);
    
	@Query("select u from ManagerDTO u where u.logHis.userId=?1 ORDER BY u.allTime DESC")
	Page<ManagerDTO> findByLoginIdday(Long UserId, Pageable pageable);

}
