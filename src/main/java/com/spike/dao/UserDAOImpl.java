package com.spike.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private UserRepository spikeRepo;

	@Override
	public void insetMember(UserDTO s) {
		this.spikeRepo.save(s);
	}
	
	@Override
	public UserDTO idCheck(String id) {
		Optional<UserDTO> result = this.spikeRepo.findid(id);
		UserDTO member;
		if(result.isPresent()) {
			member = result.get();
		} else {
			member = null;
		}
		return member;
	}

	@Override
	public UserDTO loginCheck(String login_id) {
		UserDTO s =  this.spikeRepo.loginCheck(login_id);
		return s;
	}

	@Override
	public UserDTO findId(UserDTO s) {
		UserDTO is = this.spikeRepo.findUserid(s.getName(), s.getPhone());
		return is;
	}

	@Override
	public UserDTO findPwd(UserDTO s) {
		UserDTO ps = this.spikeRepo.findUserpwd(s.getLogin_id(), s.getName());
		return ps;
	}

	@Override
	public UserDTO findMember(UserDTO s) {
		UserDTO fm = this.spikeRepo.findMember(s.getLogin_id(), s.getName());
		return null;
	}
	
	@Override
	public UserDTO changePwd(UserDTO s) {
	    // 로그인 아이디와 이름으로 사용자를 조회하고 비밀번호를 업데이트
	    int updateCount = this.spikeRepo.changePwd(s.getPassword(), s.getLogin_id(), s.getName());
	    
	    // 업데이트된 행이 있으면 수정된 사용자를 반환
	    if (updateCount > 0) {
	        return this.spikeRepo.findMember(s.getLogin_id(), s.getName());
	    } else {
	        return null; // 실패 시 null 반환
	    }
	}



}
