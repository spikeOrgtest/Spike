package com.spike.service;

import com.spike.dto.LoanDTO;
import java.util.List;

public interface LoanService {

	void createLoan(LoanDTO s);

	List<LoanDTO> findAllLoans();

	boolean acceptLoan(Long userId, long loanAmount);

	boolean rejectLoan(Long loanId);

}
