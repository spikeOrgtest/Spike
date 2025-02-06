package com.spike.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.LoginHistoryDAO;
import com.spike.dto.ManagerDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.LoginHistoryRepository;
import com.spike.repository.UserRepository;

@Service
public class LoginHistoryServiceImpl implements LoginHistoryService {

	 @Autowired
	 private UserRepository userRepository;
	 
	 @Autowired
	 private LoginHistoryRepository loginHistoryRepository;
	 
	 @Autowired
	 private LoginHistoryDAO loginHistoryDAO;

	/* @Override
	   public void recordLogin(String loginId) {
	       // 로그인한 사용자 찾기
	        UserDTO user = userRepository.findByLoginIdday(loginId)
	                .orElseThrow(() -> new RuntimeException("User not found"));/
	        // 로그인 기록 저장
	        ManagerDTO loginHistory = new ManagerDTO();
	       loginHistory.setLogHis(user);
	        loginHistory.setAllTime(LocalDateTime.now());

	       loginHistoryRepository.save(loginHistory);
	    }*/
	 
	//@Override
	//public List<ManagerDTO> getLoginHistory(String loginId) {
	//	return loginHistoryRepository.findByLogHis_LoginIdOrderByAllTimeDesc(loginId);
	//}

	@Override  // 라스트로그인을 저장하는메서드
	public void saveLoginHistory(ManagerDTO mlist) {
        loginHistoryRepository.save(mlist);
	}

	@Override
	public List<ManagerDTO> findByLoginIdday() {
		return this.loginHistoryDAO.findByLoginIdday();
	}
	

}
