package com.spike.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.LoanDAO;
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

	// 대출 수락 처리
    @Override
    public boolean acceptLoan(Long userId, long loanAmount) {
        // 유저 정보 가져오기
        UserDTO user = userRepository.findById(userId).orElse(null);
        if (user == null) {
            return false;  // 유저가 존재하지 않으면 실패 처리
        }

        // 대출 수락 로직
        LoanDTO loan = new LoanDTO();
        loan.setOwner(user);
        loan.setLoanAmount(loanAmount);
        loan.setLoanState("수락됨");

        loanRepository.save(loan);  // 대출 정보 저장

        return true;  // 성공 처리
    }

    // 대출 거절 처리
    @Override
    public boolean rejectLoan(Long loanId) {
        // 대출 정보 가져오기
        LoanDTO loan = loanRepository.findById(loanId).orElse(null);
        if (loan == null) {
            return false;  // 대출 정보가 없으면 실패 처리
        }

        // 대출 거절 로직
        loan.setLoanState("거절됨");
        loanRepository.save(loan);  // 대출 상태 업데이트

        return true;  // 성공 처리
    }
}