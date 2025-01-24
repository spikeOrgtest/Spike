package com.spike.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.LoanDTO;
import com.spike.repository.LoanRepository;

@Repository
public class LoanDAOImpl implements LoanDAO {

	@Autowired
	private LoanRepository loanrepo;
	
	@Override
	public void createLoan(LoanDTO s) {
		this.loanrepo.save(s);
	}
}
