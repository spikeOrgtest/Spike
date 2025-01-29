package com.spike.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;
import com.spike.repository.UserRepository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private UserRepository spikeRepo;

	@Autowired
	private AccountRepository accountRepo;

	@Override
	public void insetMember(UserDTO s) {
		this.spikeRepo.save(s);
	}

	@Override
	public UserDTO idCheck(String id) {
		Optional<UserDTO> result = this.spikeRepo.findid(id);
		UserDTO member;
		if (result.isPresent()) {
			member = result.get();
		} else {
			member = null;
		}
		return member;
	}

	@Override
	public UserDTO loginCheck(String loginId) {
		UserDTO s = this.spikeRepo.loginCheck(loginId); // 입력한 ID와 DB에 저장되있는 ID 비교

		if (s == null) {
			return null; // 사용자 없음
		}

		s.setLast_login(LocalDateTime.now()); // 로그인시점 현재시간으로 대입
		this.spikeRepo.save(s); // DB에 저장
		return s;
	}

	@Override
	public UserDTO findId(UserDTO s) {
		UserDTO is = this.spikeRepo.findUserid(s.getName(), s.getPhone());
		return is;
	}

	@Override
	public UserDTO findPwd(UserDTO s) {
		UserDTO ps = this.spikeRepo.findUserpwd(s.getLoginId(), s.getName());
		return ps;
	}

	@Override
	public UserDTO findMember(UserDTO s) {
		UserDTO fm = this.spikeRepo.findMember(s.getLoginId(), s.getName());
		return null;
	}

	@Override
	public UserDTO changePwd(UserDTO s) {
		// 로그인 아이디와 이름으로 사용자를 조회하고 비밀번호를 업데이트
		int updateCount = this.spikeRepo.changePwd(s.getPassword(), s.getLoginId(), s.getName());

		// 업데이트된 행이 있으면 수정된 사용자를 반환
		if (updateCount > 0) {
			return this.spikeRepo.findMember(s.getLoginId(), s.getName());
		} else {
			return null; // 실패 시 null 반환
		}
	}

	@Override
	public void profileEdit(UserDTO s) {
		this.spikeRepo.profileEdit(s.getName(), s.getEmail_id(), s.getEmail_domain(), s.getPassword(), s.getLoginId());

	}

	@Override
	public void mypageEdit(UserDTO s) {
		this.spikeRepo.mypageEdit(s.getName(), s.getEmail_id(), s.getEmail_domain(), s.getPhone(), s.getPhone01(),
				s.getPhone02(), s.getPhone03(), s.getPostcode(), s.getRoadAddress(), s.getJibunAddress(),
				s.getDetailAddress(), s.getReferences(), s.getPassword(), s.getLoginId());
	}

	@Override
	public UserDTO findFromSession(String loginId) {
		return this.spikeRepo.findFromSession(loginId);
	}

	@Override
	public void usersecession(String loginId) {
		this.spikeRepo.usersecession(loginId);
	}

	@Override
	public List<AccountDTO> findbyinquriy(Long userId) {
		return this.spikeRepo.findByUserId(userId);
	}

	@Override
	public List<String> findbyaccountnumber(Long userId) {
		return this.spikeRepo.findbyaccountnumber(userId);
	}

	@Override
	public Long todayloge() {
		return this.spikeRepo.todayloge();
	}

	@Override
	public Long newMember() {
		return this.spikeRepo.newMember();
	}

	@Override
	public List<UserDTO> findByUserList() {
		return this.spikeRepo.findAll();
	}

	@Override
	public List<UserDTO> findByUserIdEdit(Long user_id) {
		return this.spikeRepo.findByUserIdEdit(user_id);
	}

	@Override
	public void UpdateUser(String is_minor, String status, Long user_id) {
		this.spikeRepo.UpdateUser(is_minor, status, user_id);
	}

	@Override
	public void UserDelete(Long user_id) {
		this.spikeRepo.UserDelete(user_id);
	}

	@Override
	public void AccountDelete(Long user_id) {
		this.spikeRepo.AccountDelete(user_id);
	}

}
