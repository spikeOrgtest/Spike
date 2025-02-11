package com.spike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import org.springframework.data.domain.Pageable;


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
	public Long todaylog() {
		return this.spikeDao.todaylog();
	}

	@Override
	public Long newMember() {
		return this.spikeDao.newMember();
	}

	@Override
	public Page<UserDTO> findByUserList(int page, int size) {
		return this.spikeDao.findByUserList(page, size);
	}

	@Override
	public List<UserDTO> findByUserIdEdit(Long UserId) {
		return this.spikeDao.findByUserIdEdit(UserId);
	}

	@Override
	public void UpdateUser(String isMinor, String status, String roles, Long userId) {
		this.spikeDao.UpdateUser(isMinor, status, roles, userId);
	}

	@Override
	public void UserDelete(Long UserId) {
		this.spikeDao.UserDelete(UserId);
	}

	@Override
	public void AccountDelete(Long UserId) {
		this.spikeDao.AccountDelete(UserId);
	}
/*
	// 퀴즈 포인트 적립
	@Override
	public void addPoints(UserDTO user, Integer value) { // 로그인 유저에 포인트 더해주는 코드
		UserDTO realUser = this.spikeDao.findId(user);
		this.spikeDao.updateUserPoint(user.getUserId(), realUser.getPoint() + value);
	}
*/
	@Override
	public UserDTO findById(Long userId) {
		// userId로 UserDTO를 찾아 반환
		return userRepository.findById(userId).orElse(null);
	}
	
	// 퀴즈 포인트 적립 및 차감
		@Override
		public void addPoints(UserDTO user, Integer value) { //로그인 유저에 포인트 더해주는 코드
			UserDTO realUser = this.spikeDao.findId(user);
			
			// 포인트 업데이트 (value가 음수면 차감, 양수면 적립)
			int updatedPoints = realUser.getPoint() + value;
			
			// 포인트가 0 미만이 되는 경우 방지
			if (updatedPoints < 0) {
				throw new IllegalArgumentException("포인트가 부족합니다.");
			}
			
			this.spikeDao.updateUserPoint(user.getUserId(), updatedPoints);
		}

	@Override
	public List<UserDTO> visitors() {
		return this.spikeDao.visitors();
	}

	@Override
	public Page<UserDTO> getTodaylist(Pageable visipage) {
		return this.userRepository.getTodaylist(visipage);
	}

	@Override
	public Long getallvisit() {
		return this.userRepository.getallvisit();
	}

	@Override
	public Long getallamount() {// 오늘의 총 거래금액
		return this.userRepository.getallamount();
	}

	@Override  
	public Long getallTransaction() { // 오늘의 거래건수
		return this.userRepository.getallTransaction();
	}

	@Override
	public Long getallLoanId() {
		return this.userRepository.getallLoanId();
	}

	@Override
	public Long getallloanAmount() {
		return this.userRepository.getallloanAmount();
	}

}
