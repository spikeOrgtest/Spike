package com.spike.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.CardDTO;
import com.spike.dto.LoanDTO;
import com.spike.dto.UserDTO;
import com.spike.service.CardService;
import com.spike.service.LoanService;

@Controller
@RequestMapping("/spike.com")
public class LoanController {

	@Autowired
	private LoanService loanService;
		
	@GetMapping("/products/loan")
	public String loan() {
		return "products/loan";
	}
		
	@GetMapping("/products/loan/subpage_l{number:\\d+}")
	public String loanSubpage(@PathVariable String number) {
		return "products/Subpage_L" + number;
	}
	
		
	@GetMapping("/products/newloan")
	public ModelAndView newLoan() {
		String[] loan_name = {"대출"};
		
		ModelAndView ss = new ModelAndView("/products/newLoan");
		ss.addObject("loan_name", loan_name);
		return ss;
	}
	
	@PostMapping("/loan_ok")
	public ModelAndView loan_ok(LoanDTO s, 
			HttpServletRequest request, BindingResult result, HttpSession session) throws IOException {
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
	    s.setOwner(sessionUser);
		this.loanService.createLoan(s);
		
		return new ModelAndView("redirect:/spike.com/products");
	}
}