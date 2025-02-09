package com.spike.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;
import com.spike.dto.CheatReportDTO;
import com.spike.dto.NotiPageDTO;
import com.spike.dto.NoticeDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;
import com.spike.repository.UserRepository;

@Repository
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private UserRepository spikeRepo;

	@Autowired
	private AccountRepository accountRepo;

	private Object sqlSession;

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

		s.setLastLogin(LocalDateTime.now()); // 로그인시점 현재시간으로 대입
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
		this.spikeRepo.profileEdit(s.getName(), s.getEmailId(), s.getEmailDomain(), s.getPassword(), s.getLoginId());

	}

	@Override
	public void mypageEdit(UserDTO s) {
		this.spikeRepo.mypageEdit(s.getName(), s.getEmailId(), s.getEmailDomain(), s.getPhone(), s.getPhone01(),
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
	public Long todaylog() {
		return this.spikeRepo.todaylog();
	}

	@Override
	public Long newMember() {
		return this.spikeRepo.newMember();
	}

	@Override
	public Page<UserDTO> findByUserList(int page, int size) {
		Pageable pageable = PageRequest.of(page, size, Sort.by(Sort.Order.asc("userId"))); // reportId 기준으로 오름차순 정렬
		return this.spikeRepo.findByUserList(pageable);
	}
	
	@Override
	public List<UserDTO> findByUserIdEdit(Long UserId) {
		return this.spikeRepo.findByUserIdEdit(UserId);
	}

	@Override
	public void UpdateUser(String isMinor, String status, String roles, Long userId) {
		this.spikeRepo.UpdateUser(isMinor, status, roles, userId);
	}

	@Override
	public void UserDelete(Long UserId) {
		this.spikeRepo.UserDelete(UserId);
	}

	@Override
	public void AccountDelete(Long UserId) {
		this.spikeRepo.AccountDelete(UserId);
	}
	
	// 포인트 추가
		@Override
		public void updateUserPoint(Long userId, Integer value) {
			this.spikeRepo.updateUserPoint(userId, value);
		}

	@Override
	public List<UserDTO> visitors() {
		return this.spikeRepo.findAll();
	}


}
