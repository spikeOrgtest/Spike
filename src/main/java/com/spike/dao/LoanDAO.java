package com.spike.dao;

import java.util.List;
import java.util.Optional;

import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;

public interface LoanDAO {
    public void createLoan(LoanDTO s);
    public List<LoanDTO> findAllLoans();
    List<LoanDTO> findByOwnerId(Long userId);
    // 추가되는 메서드들
    public Optional<LoanDTO> findByOwnerAndLoanState(UserDTO owner, String loanState);
    public boolean updateLoanState(Long loanId, String state, long loanAmount);
    public Optional<LoanDTO> findById(Long loanId);
    List<LoanDTO> findByOwnerIdWithAccount(Long userId);
}
