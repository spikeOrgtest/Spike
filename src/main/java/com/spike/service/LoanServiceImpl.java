package com.spike.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.LoanDAO;
import com.spike.dto.AccountDTO;
import com.spike.dto.LoanDTO;
import com.spike.repository.LoanRepository;

@Service

public class LoanServiceImpl implements LoanService {

	@Autowired
	private LoanDAO loandao;

	@Autowired
	private LoanRepository loanRepository;

	@Autowired
	private AccountService accountService;

	@Override
	public void createLoan(LoanDTO s) {
		this.loandao.createLoan(s);
	}

	@Override
	public List<LoanDTO> findAllLoans() {
		return this.loandao.findAllLoans();
	}

	// 대출 수락 처리
	public void acceptLoan(Long loanId, Long userId) {
		// 1. 대출 신청 정보 조회
		Optional<LoanDTO> loanOptional = loanRepository.findById(loanId); // findById 메서드 사용

		if (loanOptional.isPresent()) {
			LoanDTO loan = loanOptional.get();

			if (loan.getOwner().getUserId().equals(userId)) {
				// 2. 대출 상태를 'ACCEPTED'로 변경
				loan.setLoanState("ACCEPTED");
				loanRepository.save(loan); // 대출 상태 업데이트

				// 3. 대출금액을 계좌에 반영
				AccountDTO account = accountService.findByAccount(loan.getOwner().getLoginId());
				if (account != null) {
					account.setBalance(account.getBalance() + loan.getLoanAmount()); // 계좌 잔액에 대출 금액 추가
					accountService.updateAccount(account); // 계좌 업데이트
				}
			}
		}
	}

	@Override
	public void rejectLoan(Long loanId) {
		LoanDTO loan = loanRepository.findById(loanId)
				.orElseThrow(() -> new IllegalArgumentException("Invalid loanId"));
		loan.setLoanState("거절됨"); // Update loan state to 'Rejected'
		loanRepository.save(loan);
	}
}