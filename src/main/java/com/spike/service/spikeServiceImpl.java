package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.spikeDAO;
import com.spike.dto.spikeDTO;

@Service
public class spikeServiceImpl implements spikeSerivce {

	@Autowired
	private spikeDAO spikeDao;

    @Override
    public void insertMember(spikeDTO s) {
    	
        this.spikeDao.insetMember(s);
    }

	@Override
	public spikeDTO idCheck(String id) {
		return this.spikeDao.idCheck(id);
	}

	@Override
	public spikeDTO loginCheck(String login_id) {
		return this.spikeDao.loginCheck(login_id);
	}

	@Override
	public spikeDTO findId(spikeDTO s) {
		return this.spikeDao.findId(s);
	}

	@Override
	public spikeDTO findPwd(spikeDTO s) {
		return this.spikeDao.findPwd(s);
	}

	@Override
	public spikeDTO changePwd(spikeDTO s) {
		return this.spikeDao.changePwd(s);
	}

	@Override
	public spikeDTO findMember(spikeDTO s) {
		return this.spikeDao.findMember(s);
	}
	

}
