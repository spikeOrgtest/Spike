package com.spike.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spike.dao.LoanDAO;
import com.spike.dto.AccountDTO;
import com.spike.dto.LoanDTO;
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

            // 대출 계좌 설정
            targetAccount.setAccountType("대출");
            targetAccount.setInterestRate(5.0); // 대출 기본금리 5%
            targetAccount.setBonusRate(2.0);    // 우대금리 2%
            targetAccount.setStartDate(java.sql.Date.valueOf(LocalDate.now()));
            targetAccount.calculateTotalRate(); // 총 이자율 계산
            targetAccount.setLoanPrincipal(loanAmount); // 대출 원금 설정
            targetAccount.setInterestAmount(0L);        // 초기 이자액 0으로 설정

            // 계좌 잔액 업데이트
            Long newBalance = targetAccount.getBalance() + loanAmount;
            targetAccount.setBalance(newBalance);

            System.out.println("계좌 잔액 업데이트 완료 - 새로운 잔액: " + newBalance);

            // 대출 상태 업데이트 시 정확한 문자열 사용
            loan.setLoanState("완료");  // 이 부분이 정확히 "완료"로 설정되는지 확인
            loan.setLoanAmount(loanAmount);
            loan.setRemainingAmount(loanAmount); // 남은 상환금액을 대출금액으로 설정

            // 디버깅용 로그 추가
            System.out.println("대출 승인 완료 - 상태: " + loan.getLoanState());
            System.out.println("대출 승인 완료 - 대출금액: " + loan.getLoanAmount());
            System.out.println("대출 승인 완료 - 남은금액: " + loan.getRemainingAmount());

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

    @Transactional
    @Override
    public boolean repayLoan(Long loanId, Long amount) {
        try {
            Optional<LoanDTO> optionalLoan = loanRepository.findByIdWithAccount(loanId);
            if (!optionalLoan.isPresent()) {
                throw new RuntimeException("대출을 찾을 수 없습니다.");
            }

            LoanDTO loan = optionalLoan.get();
            AccountDTO targetAccount = loan.getTargetAccount();
            AccountDTO repaymentAccount = loan.getRepaymentAccount();

            // 이자 계산 실행
            accountService.calculateDailyLoanInterest(targetAccount);
            
            // 현재 이자 금액 계산
            Long currentInterest = targetAccount.getInterestAmount();
            
            if (repaymentAccount.getBalance() < amount) {
                throw new RuntimeException("상환계좌의 잔액이 부족합니다.");
            }

            // 상환금액을 이자와 원금에 배분
            Long interestPayment = Math.min(currentInterest, amount);
            Long principalPayment = amount - interestPayment;

            // 상환계좌에서 금액 차감
            repaymentAccount.setBalance(repaymentAccount.getBalance() - amount);
            accountService.updateAccount(repaymentAccount);

            // 대출 계좌 업데이트
            targetAccount.setInterestAmount(currentInterest - interestPayment);
            targetAccount.setLoanPrincipal(targetAccount.getLoanPrincipal() - principalPayment);
            accountService.updateAccount(targetAccount);

            // 남은 상환금액 업데이트 (원금 + 이자)
            loan.setRemainingAmount(targetAccount.getLoanPrincipal());
            loan.setRemainingInterest(targetAccount.getInterestAmount());
            
            if (targetAccount.getLoanPrincipal() <= 0 && targetAccount.getInterestAmount() <= 0) {
                loan.setLoanState("상환완료");
                targetAccount.setAccountType("일반");
                accountService.updateAccount(targetAccount);
            }
            
            loanRepository.save(loan);
            
            System.out.println("상환 처리 완료:");
            System.out.println("원금: " + targetAccount.getLoanPrincipal());
            System.out.println("현재 이자: " + targetAccount.getInterestAmount());
            System.out.println("상환 금액: " + amount);
            System.out.println("이자 상환액: " + interestPayment);
            System.out.println("원금 상환액: " + principalPayment);
            System.out.println("남은 원금: " + loan.getRemainingAmount());
            System.out.println("남은 이자: " + loan.getRemainingInterest());
            
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("대출 상환 처리 중 오류가 발생했습니다: " + e.getMessage());
        }
    }

    @Override
    public Long getRemainingAmount(Long loanId) {
        Optional<LoanDTO> loan = loanRepository.findById(loanId);
        return loan.map(LoanDTO::getRemainingAmount).orElse(null);
    }
}