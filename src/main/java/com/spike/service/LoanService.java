package com.spike.service;

import com.spike.dto.LoanDTO;
import java.util.List;


public interface LoanService {

	void createLoan(LoanDTO s);

	List<LoanDTO> findAllLoans();
	
	void acceptLoan(Long loanId, Long userId);

	void rejectLoan(Long loanId);

}
