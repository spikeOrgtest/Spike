package com.spike.service;

import com.spike.dto.UserDTO;

public interface UserSerivce {

	void insertMember(UserDTO s);

	UserDTO idCheck(String id);

	UserDTO loginCheck(String loginId);

	UserDTO findId(UserDTO s);

	UserDTO findPwd(UserDTO s);

	UserDTO changePwd(UserDTO s);

	UserDTO findMember(UserDTO s);

	void profileEdit(UserDTO s);

	void mypageEdit(UserDTO s);

	UserDTO findFromSession(String loginId);

}
