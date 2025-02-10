package com.spike.repository;

import java.util.Optional;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;

@Repository
public interface LoanRepository extends JpaRepository<LoanDTO, Long> {
    
    @Query("SELECT sum(s.loanAmount) FROM LoanDTO s WHERE DATE(s.createdDate) = CURRENT_DATE AND s.loanState = '완료'")  
    Long getallloanAmount();
    
    @Query("SELECT l FROM LoanDTO l WHERE l.owner = :owner AND l.loanState = :loanState")
    Optional<LoanDTO> findByOwnerAndLoanState(@Param("owner") UserDTO owner, @Param("loanState") String loanState);

    @Query("SELECT l FROM LoanDTO l " +
           "LEFT JOIN FETCH l.targetAccount " +
           "LEFT JOIN FETCH l.repaymentAccount " +
           "LEFT JOIN FETCH l.owner " +
           "WHERE l.owner.userId = :ownerId")
    List<LoanDTO> findByOwnerId(@Param("ownerId") Long ownerId);

    @Query("SELECT l FROM LoanDTO l " +
           "LEFT JOIN FETCH l.targetAccount " +
           "LEFT JOIN FETCH l.repaymentAccount " +
           "LEFT JOIN FETCH l.owner " +
           "WHERE l.owner.userId = :ownerId")
    List<LoanDTO> findByOwnerIdWithAccount(@Param("ownerId") Long ownerId);

    @Query("SELECT l FROM LoanDTO l " +
           "LEFT JOIN FETCH l.targetAccount " +
           "LEFT JOIN FETCH l.repaymentAccount " +
           "LEFT JOIN FETCH l.owner " +
           "WHERE l.loanId = :loanId")
    Optional<LoanDTO> findByIdWithAccount(@Param("loanId") Long loanId);
}
