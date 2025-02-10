package com.spike.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
	public ModelAndView newLoan(HttpSession session, HttpServletResponse response) throws IOException {
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
	    return ss;
	}



	@PostMapping("/loan_ok")
	public ModelAndView loan_ok(LoanDTO s, 
			HttpServletRequest request, BindingResult result, HttpSession session) throws IOException {
		if (session.getAttribute("User") == null) {
			return new ModelAndView("redirect:/spike.com/login");
		}
		
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
		s.setOwner(sessionUser);
		s.setLoanState("대기 중");
		this.loanService.createLoan(s);
		
		// 대출 신청 후 loanManagement로 리다이렉트
		return new ModelAndView("redirect:/spike.com/admin/loanManagement"); // 대출 관리 페이지로 리다이렉트
	}
	
	// 대출 수락 처리
    @PostMapping("/admin/acceptLoan")
    public String acceptLoan(@RequestParam("userId") Long userId, 
                             @RequestParam("loanAmount") long loanAmount, 
                             HttpSession session) {
        UserDTO sessionUser = (UserDTO) session.getAttribute("User");
        
        if (sessionUser == null) {
            return "redirect:/spike.com/login"; // 로그인 상태 확인
        }

        // 대출 수락 로직
        boolean isAccepted = loanService.acceptLoan(userId, loanAmount);

        if (isAccepted) {
            return "redirect:/spike.com/admin/loanManagement"; // 대출 관리 페이지로 리다이렉트
        } else {
            // 대출 수락 실패 시 처리
            return "redirect:/spike.com/admin/loanManagement?error=true";
        }
    }

    // 대출 거절 처리
    @PostMapping("/admin/rejectLoan")
    public String rejectLoan(@RequestParam("loanId") Long loanId, HttpSession session) {
        UserDTO sessionUser = (UserDTO) session.getAttribute("User");
        
        if (sessionUser == null) {
            return "redirect:/spike.com/login"; // 로그인 상태 확인
        }

        // 대출 거절 로직
        boolean isRejected = loanService.rejectLoan(loanId);

        if (isRejected) {
            return "redirect:/spike.com/admin/loanManagement"; // 대출 관리 페이지로 리다이렉트
        } else {
            // 대출 거절 실패 시 처리
            return "redirect:/spike.com/admin/loanManagement?error=true";
        }
    }
	
}