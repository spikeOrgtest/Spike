package com.spike.service;

import java.util.List;

import com.spike.dto.ManagerDTO;

public interface LoginHistoryService {


	List<ManagerDTO> getLoginHistory(String loginId);

	void recordLogin(String loginId);


   
	
}
