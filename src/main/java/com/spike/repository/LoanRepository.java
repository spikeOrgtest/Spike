package com.spike.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;

@Repository
public interface LoanRepository extends JpaRepository<LoanDTO, Long> {
    
    @Query(value = "SELECT NVL(SUM(s.loan_amount), 0) FROM loan s " +
           "WHERE TRUNC(s.created_date) = TRUNC(SYSDATE) AND s.loan_state = '완료'", 
           nativeQuery = true)  
    Long getallloanAmount();
    
    @Query("SELECT l FROM LoanDTO l WHERE l.owner = :owner AND l.loanState = :loanState")
    Optional<LoanDTO> findByOwnerAndLoanState(@Param("owner") UserDTO owner, @Param("loanState") String loanState);

    @Query(value = "SELECT l.* FROM loan l " +
           "LEFT JOIN account ta ON l.account_id = ta.account_id " +
           "LEFT JOIN account ra ON l.repayment_account_id = ra.account_id " +
           "LEFT JOIN user_info u ON l.owner_user_id = u.user_id " +
           "WHERE l.owner_user_id = :ownerId", 
           nativeQuery = true)
    List<LoanDTO> findByOwnerId(@Param("ownerId") Long ownerId);

    @Query(value = "SELECT l.* FROM loan l " +
           "LEFT JOIN account ta ON l.account_id = ta.account_id " +
           "LEFT JOIN account ra ON l.repayment_account_id = ra.account_id " +
           "LEFT JOIN user_info u ON l.owner_user_id = u.user_id " +
           "WHERE l.owner_user_id = :ownerId", 
           nativeQuery = true)
    List<LoanDTO> findByOwnerIdWithAccount(@Param("ownerId") Long ownerId);

    @Query(value = "SELECT l.* FROM loan l " +
           "LEFT JOIN account ta ON l.account_id = ta.account_id " +
           "LEFT JOIN account ra ON l.repayment_account_id = ra.account_id " +
           "LEFT JOIN user_info u ON l.owner_user_id = u.user_id " +
           "WHERE l.loan_id = :loanId", 
           nativeQuery = true)
    Optional<LoanDTO> findByIdWithAccount(@Param("loanId") Long loanId);
}