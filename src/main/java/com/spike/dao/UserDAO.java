package com.spike.dao;

import java.util.List;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;

public interface UserDAO {

	void insetMember(UserDTO s);

	UserDTO idCheck(String id);

	UserDTO loginCheck(String loginId);

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

	Long todayloge();
	
	// 퀴즈 포인트 쌓기 
	void updateUserPoint(Long userId, Integer value);

	Long newMember();

	List<UserDTO> findByUserList();

	List<UserDTO> findByUserIdEdit(Long user_id);

	void UpdateUser(String is_minor, String status, Long user_id);

	void UserDelete(Long user_id);

	void AccountDelete(Long user_id);

}
