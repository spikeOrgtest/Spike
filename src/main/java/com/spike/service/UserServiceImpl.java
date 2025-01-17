package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.UserDAO;
import com.spike.dto.UserDTO;

@Service
public class UserServiceImpl implements UserSerivce {

	@Autowired
	private UserDAO spikeDao;

	@Override
	public void insertMember(UserDTO s) {

		this.spikeDao.insetMember(s);
	}

	@Override
	public UserDTO idCheck(String id) {
		return this.spikeDao.idCheck(id);
	}

	@Override
	public UserDTO loginCheck(String loginId) {
		return this.spikeDao.loginCheck(loginId);
	}

	@Override
	public UserDTO findId(UserDTO s) {
		return this.spikeDao.findId(s);
	}

	@Override
	public UserDTO findPwd(UserDTO s) {
		return this.spikeDao.findPwd(s);
	}

	@Override
	public UserDTO changePwd(UserDTO s) {
		return this.spikeDao.changePwd(s);
	}

	@Override
	public UserDTO findMember(UserDTO s) {
		return this.spikeDao.findMember(s);
	}

	@Override
	public void profileEdit(UserDTO s) {
		this.spikeDao.profileEdit(s);
	}

	@Override
	public void mypageEdit(UserDTO s) {
		this.spikeDao.mypageEdit(s);
	}

	@Override
	public UserDTO findFromSession(String loginId) {
		return this.spikeDao.findFromSession(loginId);
	}

}
