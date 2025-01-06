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
	
	/*@Override
	public spikeDTO idCheck(String id) {
		return this.spikeDao.idCheck(id);
	}*/

}
