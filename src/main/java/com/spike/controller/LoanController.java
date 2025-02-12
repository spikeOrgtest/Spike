package com.spike.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;
import com.spike.service.AccountService;
import com.spike.service.LoanService;
import com.spike.service.UserSerivce;

@Controller
@RequestMapping("/spike.com")
public class LoanController {

	@Autowired
	private LoanService loanService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private UserSerivce userService;
		
	@GetMapping("/products/loan")
	public String loan() {
		return "products/loan";
	}
		
	@GetMapping("/products/loan/subpage_l{number:\\d+}")
	public String loanSubpage(@PathVariable String number) {
		return "products/Subpage_L" + number;
	}
	
		
	@GetMapping("/products/newloan")
	public ModelAndView newLoan(
	        @RequestParam(required = false) String productType,
	        HttpSession session, 
	        HttpServletResponse response) throws IOException {
	    response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    if (session.getAttribute("User") == null) {
	        out.println("<script>");
	        out.println("alert('로그인이 필요한 서비스입니다.');");
	        out.println("location.href='/spike.com/login';");
	        out.println("</script>");
	        return null;
	    }

	    UserDTO user = (UserDTO) session.getAttribute("User");

	    // 미성년자 체크 (isMinor가 "minor"일 경우)
	    if ("minor".equals(user.getIsMinor())) {
	        out.println("<script>");
	        out.println("alert('미성년자는 대출이 불가능합니다.');");
	        out.println("location.href='/spike.com/';"); // 예: 메인 페이지로 리다이렉트
	        out.println("</script>");
	        return null;
	    }

	    List<AccountDTO> accounts = accountService.getActiveAccountsForUser(user); // ACTIVE 계좌만 가져오기

	    String[] loan_name = {"대출상품"};
	    ModelAndView ss = new ModelAndView("/products/newLoan");
	    ss.addObject("loan_name", loan_name);
	    ss.addObject("accounts", accounts);
	    ss.addObject("selectedProductType", productType); // 선택된 상품 타입 추가
	    return ss;
	}



	@PostMapping("/loan_ok")
    public void loan_ok(
            @RequestParam("targetAccountId") Long targetAccountId,
            @RequestParam("repayment_account") Long repaymentAccountId,
            LoanDTO s, 
            HttpSession session,
            HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            UserDTO sessionUser = (UserDTO) session.getAttribute("User");
            if (sessionUser == null) {
                out.println("<script>");
                out.println("alert('로그인이 필요한 서비스입니다.');");
                out.println("location.href='/spike.com/login';");
                out.println("</script>");
                return;
            }
            
            // 계좌 정보 조회 및 설정
            AccountDTO targetAccount = accountService.findById(targetAccountId)
                .orElseThrow(() -> new RuntimeException("선택된 계좌를 찾을 수 없습니다."));
            
            AccountDTO repaymentAccount = accountService.findById(repaymentAccountId)
                .orElseThrow(() -> new RuntimeException("선택된 상환계좌를 찾을 수 없습니다."));
            
            s.setOwner(sessionUser);
            s.setLoanState("대기 중");
            s.setTargetAccount(targetAccount);
            s.setRepaymentAccount(repaymentAccount);
            s.setRemainingAmount(s.getLoanAmount());
            
            this.loanService.createLoan(s);
            
            out.println("<script>");
            out.println("alert('대출 신청이 완료되었습니다. 승인 심사 후 결과를 알려드립니다.');");
            out.println("location.href='/spike.com/mypage/myloans';");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<script>");
            out.println("alert('대출 신청 처리 중 오류가 발생했습니다: " + e.getMessage() + "');");
            out.println("history.back();");
            out.println("</script>");
        }
    }
	
	// 대출 수락 처리
	@PostMapping("/admin/acceptLoan")
    public void acceptLoan(@RequestParam("userId") Long userId,
                          @RequestParam("loanAmount") Long loanAmount,
                          @RequestParam("loanId") Long loanId,
                          HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            boolean isAccepted = loanService.acceptLoan(userId, loanAmount);
            if (isAccepted) {
                out.println("<script>");
                out.println("alert('대출이 승인되었으며, 해당 계좌로 대출금이 입금되었습니다.');");
                out.println("location.href='/spike.com/admin/loanManagement';");
                out.println("</script>");
            } else {
                throw new RuntimeException("대출 승인 처리에 실패했습니다.");
            }
        } catch (Exception e) {
            out.println("<script>");
            out.println("alert('오류 발생: " + e.getMessage() + "');");
            out.println("history.back();");
            out.println("</script>");
        }
    }

    // 대출 거절 처리
    @PostMapping("/admin/rejectLoan")
    public String rejectLoan(@RequestParam("loanId") Long loanId, 
                            HttpSession session,
                            HttpServletResponse response) throws IOException {
        try {
            UserDTO sessionUser = (UserDTO) session.getAttribute("User");
            
            if (sessionUser == null) {
                return "redirect:/spike.com/login";
            }

            boolean isRejected = loanService.rejectLoan(loanId);
            if (isRejected) {
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>");
                out.println("alert('대출이 거절되었습니다.');");
                out.println("location.href='/spike.com/admin/loanManagement';");
                out.println("</script>");
                return null;
            } else {
                return "redirect:/spike.com/admin/loanManagement?error=true";
            }
        } catch (Exception e) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('처리 중 오류가 발생했습니다: " + e.getMessage() + "'); history.back();</script>");
            return "redirect:/spike.com/admin/loanManagement?error=true";
        }
    }
	
    @GetMapping("/admin/loanManagement")
    public ModelAndView loanManagement() {
        List<LoanDTO> loanList = this.loanService.findAllLoans();
        ModelAndView um = new ModelAndView("manager/loanManagement");
        um.addObject("loanList", loanList);
        return um;
    }
    
    @GetMapping("/admin/loanState")
    public ModelAndView loanState(@RequestParam("loanId") Long loanId) {
        // findByIdWithAccount 메서드 사용
        Optional<LoanDTO> loan = loanService.findByIdWithAccount(loanId);
        
        if(loan.isPresent()) {
            LoanDTO loanDTO = loan.get();
            UserDTO user = loanDTO.getOwner();
            AccountDTO account = loanDTO.getTargetAccount();
            
            System.out.println("대출 상세 조회 - 대출 ID: " + loanDTO.getLoanId());
            System.out.println("대출 상세 조회 - 계좌 정보: " + 
                (account != null ? account.getAccountNumber() : "없음"));
            
            ModelAndView em = new ModelAndView("manager/loanState");
            em.addObject("user", user);
            em.addObject("loan", loanDTO);
            return em;
        }
        
        return new ModelAndView("redirect:/spike.com/admin/loanManagement");
    }

    @PostMapping("/repayLoan")
    public void repayLoan(
            @RequestParam("loanId") Long loanId,
            @RequestParam("amount") Long amount,
            HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            boolean isRepaid = loanService.repayLoan(loanId, amount);
            if (isRepaid) {
                out.println("<script>");
                out.println("alert('상환이 완료되었습니다.');");
                out.println("location.href='/spike.com/mypage/myloans';");
                out.println("</script>");
            }
        } catch (Exception e) {
            out.println("<script>");
            out.println("alert('상환 처리 중 오류가 발생했습니다: " + e.getMessage() + "');");
            out.println("history.back();");
            out.println("</script>");
        }
    }

    @GetMapping("/mypage/myloans")
    public ModelAndView myLoans(HttpSession session, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        UserDTO user = (UserDTO) session.getAttribute("User");
        if (user == null) {
            out.println("<script>");
            out.println("alert('로그인이 필요한 서비스입니다.');");
            out.println("location.href='/spike.com/login';");
            out.println("</script>");
            return null;
        }

        List<LoanDTO> loans = loanService.findLoansByUserId(user.getUserId());
        
        // 남은 금액이 null인 경우 처리
        for (LoanDTO loan : loans) {
            if (loan.getRemainingAmount() == null && "완료".equals(loan.getLoanState())) {
                loan.setRemainingAmount(loan.getLoanAmount());
                loanService.createLoan(loan); // 업데이트
            }
            System.out.println("대출 ID: " + loan.getLoanId());
            System.out.println("상태: " + loan.getLoanState());
            System.out.println("대출금액: " + loan.getLoanAmount());
            System.out.println("남은금액: " + loan.getRemainingAmount());
        }

        ModelAndView mav = new ModelAndView("mypage/myLoans");
        mav.addObject("loans", loans);
        return mav;
    }
}