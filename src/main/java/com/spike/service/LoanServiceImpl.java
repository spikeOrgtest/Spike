package com.spike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.LoanDAO;
import com.spike.dto.LoanDTO;

@Service

public class LoanServiceImpl implements LoanService {

	@Autowired
	private LoanDAO loandao;
	
	@Override
	public void createLoan(LoanDTO s) {
		this.loandao.createLoan(s);
	}

	@Override
	public List<LoanDTO> findAllLoans() {
		return this.loandao.findAllLoans();
	}
}