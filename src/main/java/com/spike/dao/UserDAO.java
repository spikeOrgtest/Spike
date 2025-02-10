package com.spike.dao;

import java.util.List;

import org.springframework.data.domain.Page;

import com.spike.dto.AccountDTO;
import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;
import com.spike.dto.UserDTO;

public interface UserDAO {

	void insetMember(UserDTO s);

	UserDTO idCheck(String id);

	UserDTO findId(UserDTO s);

	UserDTO findPwd(UserDTO s);

	UserDTO changePwd(UserDTO s);

	UserDTO findMember(UserDTO s);

	void profileEdit(UserDTO s);

	void mypageEdit(UserDTO s);

	UserDTO findFromSession(String loginId);

	void usersecession(String loginId);

	List<AccountDTO> findbyinquriy(Long userId);

	List<String> findbyaccountnumber(Long userId);

	Long todaylog();


	Long newMember();

	Page<UserDTO> findByUserList(int page, int size);

	List<UserDTO> findByUserIdEdit(Long UserId);

	void UpdateUser(String isMinor, String status, String roles, Long userId);

	void UserDelete(Long UserId);

	void AccountDelete(Long UserId);
	
	// 퀴즈 포인트 쌓기 
		void updateUserPoint(Long userId, Integer value);


	List<UserDTO> visitors();


}
