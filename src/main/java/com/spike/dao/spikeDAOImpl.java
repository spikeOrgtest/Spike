package com.spike.dao;

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
	
	/*@Override
	public spikeDTO idCheck(String id) {
		return spikeRepo ;
	}*/

}
