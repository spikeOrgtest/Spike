package com.spike.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spike.dao.LoanDAO;
import com.spike.dto.AccountDTO;
import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.LoanRepository;
import com.spike.repository.UserRepository;


@Service

public class LoanServiceImpl implements LoanService {

	@Autowired
	private LoanDAO loandao;

	@Autowired
	private LoanRepository loanRepository;

	@Autowired
	private AccountService accountService;
	
	@Autowired
    private UserRepository userRepository;

	@Override
	public void createLoan(LoanDTO s) {
		this.loandao.createLoan(s);
	}

	@Override
	public List<LoanDTO> findAllLoans() {
		return this.loandao.findAllLoans();
	}

    @Override
    public Optional<LoanDTO> findById(Long loanId) {
        return loanRepository.findById(loanId);
    }

    @Override
    public List<LoanDTO> findLoansByUserId(Long userId) {
        return loanRepository.findByOwnerId(userId);
    }

    @Override
    public Optional<LoanDTO> findByIdWithAccount(Long loanId) {
        return loanRepository.findByIdWithAccount(loanId);
    }

	// 대출 수락 처리
    @Transactional
    @Override
    public boolean acceptLoan(Long userId, long loanAmount) {
        try {
            System.out.println("대출 승인 시작 - 사용자 ID: " + userId);
            
            // 대출 정보 조회
            List<LoanDTO> loans = loanRepository.findByOwnerIdWithAccount(userId);
            System.out.println("조회된 대출 건수: " + loans.size());

            // 대기 중인 대출 찾기
            Optional<LoanDTO> waitingLoan = loans.stream()
                .filter(loan -> {
                    System.out.println("대출 ID: " + loan.getLoanId() + ", 상태: " + loan.getLoanState());
                    return "대기 중".equals(loan.getLoanState());
                })
                .findFirst();

            if (!waitingLoan.isPresent()) {
                throw new RuntimeException("대기 중인 대출을 찾을 수 없습니다.");
            }

            LoanDTO loan = waitingLoan.get();
            AccountDTO targetAccount = loan.getTargetAccount();
            
            if (targetAccount == null) {
                System.out.println("대출 ID: " + loan.getLoanId() + "의 계좌 정보가 null입니다.");
                throw new RuntimeException("대출금을 입금할 계좌 정보를 찾을 수 없습니다.");
            }

            System.out.println("대출 계좌 정보 - ID: " + targetAccount.getAccountId() + 
                             ", 번호: " + targetAccount.getAccountNumber() + 
                             ", 현재 잔액: " + targetAccount.getBalance());

            // 계좌 잔액 업데이트
            Long newBalance = targetAccount.getBalance() + loanAmount;
            targetAccount.setBalance(newBalance);
            accountService.updateAccount(targetAccount);

            System.out.println("계좌 잔액 업데이트 완료 - 새로운 잔액: " + newBalance);

            // 대출 상태 업데이트
            loan.setLoanState("완료");
            loan.setLoanAmount(loanAmount);
            loanRepository.save(loan);

            System.out.println("대출 승인 완료");
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("대출 승인 처리 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    // 대출 거절 처리
    @Override
    public boolean rejectLoan(Long loanId) {
        try {
            LoanDTO loan = loanRepository.findById(loanId)
                .orElseThrow(() -> new RuntimeException("대출을 찾을 수 없습니다."));
            
            loan.setLoanState("거절");
            loanRepository.save(loan);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}