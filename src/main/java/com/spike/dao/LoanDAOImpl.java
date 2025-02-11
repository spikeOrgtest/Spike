package com.spike.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.LoanRepository;

@Repository
public class LoanDAOImpl implements LoanDAO {

    @Autowired
    private LoanRepository loanrepo;
    
    @Override
    public void createLoan(LoanDTO s) {
        this.loanrepo.save(s);
    }

    @Override
    public List<LoanDTO> findAllLoans() {
        return this.loanrepo.findAll();
    }
    
    @Override
    public Optional<LoanDTO> findByOwnerAndLoanState(UserDTO owner, String loanState) {
        return this.loanrepo.findByOwnerAndLoanState(owner, loanState);
    }
    
    @Override
    public boolean updateLoanState(Long loanId, String state, long loanAmount) {
        try {
            Optional<LoanDTO> loanOpt = loanrepo.findById(loanId);
            if (loanOpt.isPresent()) {
                LoanDTO loan = loanOpt.get();
                loan.setLoanState(state);
                if (loanAmount > 0) {
                    loan.setLoanAmount(loanAmount);
                }
                loanrepo.save(loan);
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public Optional<LoanDTO> findById(Long loanId) {
        return loanrepo.findById(loanId);
    }

    @Override
    public List<LoanDTO> findByOwnerId(Long ownerId) {
        return loanrepo.findByOwnerId(ownerId);
    }
    
    @Override
    public List<LoanDTO> findByOwnerIdWithAccount(Long userId) {
        return loanrepo.findByOwnerIdWithAccount(userId);
    }
}
