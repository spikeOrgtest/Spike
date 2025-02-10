package com.spike.dao;

import java.util.List;

import com.spike.dto.LoanDTO;

public interface LoanDAO {

	public void createLoan(LoanDTO s);

    public List<LoanDTO> findAllLoans();

}
