package com.spike.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.ManagerDTO;


@Repository
public interface LoginHistoryRepository extends JpaRepository<ManagerDTO, Long> {
    //List<ManagerDTO> findByLogHis_LoginIdOrderByAllTimeDesc(String loginId);
    //@Query("SELECT l FROM LoginHistory l WHERE l.loginId = :loginId")
    //List<ManagerDTO> findLoginHistory(@Param("loginId") String loginId);

}
