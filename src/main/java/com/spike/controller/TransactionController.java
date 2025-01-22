package com.spike.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountTestDTO;
import com.spike.dto.TransactionDTO;
import com.spike.dto.UserDTO;
import com.spike.service.TransactionService;
import com.spike.service.UserSerivce;

@Controller
@RequestMapping("/spike.com")
public class TransactionController {
	
	@Autowired
	private UserSerivce userService;
	
	@Autowired
	private TransactionService transService;
	
	@GetMapping("transfer")
	public ModelAndView Transfer(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		UserDTO user = (UserDTO)session.getAttribute("User");
		System.out.println(user);
		List<AccountTestDTO> accList = this.transService.getAccountList(user.getUser_id());
		System.out.println("=================================\n\n");
		System.out.println(accList);
		System.out.println("\n\n=================================");
		
		mv.setViewName("transfer/transfer");
		return mv;
	}
	
	@PostMapping("transfer")
	public String transfer_ok(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo) {
		
		
		
		this.transService.transfer(fromAccountId, toAccountId, amount, memo);
		
		return "mypage/inquiry";
	}
}
