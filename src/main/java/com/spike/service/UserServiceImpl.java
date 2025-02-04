package com.spike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.UserDAO;
import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.UserRepository;

@Service
public class UserServiceImpl implements UserSerivce {

	@Autowired
	private UserDAO spikeDao;
	
	@Autowired
    private UserRepository userRepository;

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

	@Override
	public void usersecession(String loginId) {
		this.spikeDao.usersecession(loginId);
	}

	@Override
	public List<AccountDTO> findbyinquriy(Long userId) {
		return this.spikeDao.findbyinquriy(userId);
	}

	@Override
	public List<String> findbyaccountnumber(Long userId) {
		return this.spikeDao.findbyaccountnumber(userId);
	}

	@Override
	public Long todayloge() {
		return this.spikeDao.todayloge();
	}

	@Override
	public Long newMember() {
		return this.spikeDao.newMember();
	}

	@Override
	public List<UserDTO> findByUserList() {
		return this.spikeDao.findByUserList();
	}

	@Override
	public List<UserDTO> findByUserIdEdit(Long UserId) {
		return this.spikeDao.findByUserIdEdit(UserId);
	}

	@Override
	public void UpdateUser(String isMinor, String status, Long userId) {
		this.spikeDao.UpdateUser(isMinor, status, userId);
	}

	@Override
	public void UserDelete(Long UserId) {
		this.spikeDao.UserDelete(UserId);
	}

	@Override
	public void AccountDelete(Long UserId) {
		this.spikeDao.AccountDelete(UserId);
	}

	// 퀴즈 포인트 적립
	@Override
	public void addPoints(UserDTO user, Integer value) { // 로그인 유저에 포인트 더해주는 코드
		UserDTO realUser = this.spikeDao.findId(user);
		this.spikeDao.updateUserPoint(user.getUserId(), realUser.getPoint() + value);
	}

	@Override
	public UserDTO findById(Long userId) {
		// userId로 UserDTO를 찾아 반환
		return userRepository.findById(userId).orElse(null);
	}

}
