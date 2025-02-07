package com.spike.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.spike.dto.ManagerDTO;

public interface LoginHistoryService {


	//List<ManagerDTO> getLoginHistory(String loginId);

	//void recordLogin(String loginId);

	void saveLoginHistory(ManagerDTO mlist); // 라스트로그인을 저장하는 메서드

	Page<ManagerDTO> findByLoginIdday(Long UserId, Pageable pageable); // 로그인시간을 보는 메서드


   
	
}
