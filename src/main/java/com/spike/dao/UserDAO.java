package com.spike.dao;

import com.spike.dto.UserDTO;

public interface UserDAO {

	void insetMember(UserDTO s);

	UserDTO idCheck(String id);

	UserDTO loginCheck(String login_id);

	UserDTO findId(UserDTO s);

	UserDTO findPwd(UserDTO s);

	UserDTO changePwd(UserDTO s);

	UserDTO findMember(UserDTO s);


}
