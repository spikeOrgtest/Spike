package com.spike.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.ManagerDTO;
import com.spike.repository.LoginHistoryRepository;

@Repository
public class LoginHistoryDAOImpl implements LoginHistoryDAO {
	
	@Autowired
	private LoginHistoryRepository loginHistoryRepository;

	@Override
	public List<ManagerDTO> findByLoginIdday() {
		return this.loginHistoryRepository.findAll();
	}

}
