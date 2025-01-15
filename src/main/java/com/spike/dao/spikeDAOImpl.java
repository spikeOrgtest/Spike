package com.spike.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.spikeDTO;

@Repository
public class spikeDAOImpl implements spikeDAO {

	@Autowired
	private spikeRepository spikeRepo;

	@Override
	public void insetMember(spikeDTO s) {
		this.spikeRepo.save(s);
	}
	
	@Override
	public spikeDTO idCheck(String id) {
		Optional<spikeDTO> result = this.spikeRepo.findid(id);
		spikeDTO member;
		if(result.isPresent()) {
			member = result.get();
		} else {
			member = null;
		}
		return member;
	}

	@Override
	public spikeDTO loginCheck(String login_id) {
		spikeDTO s =  this.spikeRepo.loginCheck(login_id);
		return s;
	}

	@Override
	public spikeDTO findId(spikeDTO s) {
		spikeDTO is = this.spikeRepo.findUserid(s.getName(), s.getPhone());
		return is;
	}

	@Override
	public spikeDTO findPwd(spikeDTO s) {
		spikeDTO ps = this.spikeRepo.findUserpwd(s.getLogin_id(), s.getName());
		return ps;
	}

	@Override
	public spikeDTO findMember(spikeDTO s) {
		spikeDTO fm = this.spikeRepo.findMember(s.getLogin_id(), s.getName());
		return null;
	}
	
	@Override
	public spikeDTO changePwd(spikeDTO s) {
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
