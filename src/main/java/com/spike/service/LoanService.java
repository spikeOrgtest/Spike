package com.spike.service;

import com.spike.dto.LoanDTO;
import java.util.List;
import java.util.Optional;

public interface LoanService {

	void createLoan(LoanDTO s);

	List<LoanDTO> findAllLoans();

	boolean acceptLoan(Long userId, Long loanAmount);

	boolean rejectLoan(Long loanId);

	List<LoanDTO> findLoansByUserId(Long userId);

	Optional<LoanDTO> findById(Long loanId);

	Optional<LoanDTO> findByIdWithAccount(Long loanId);

	boolean repayLoan(Long loanId, Long amount);

	Long getRemainingAmount(Long loanId);

}
