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

import com.spike.dto.AccountDTO;
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
		if(user != null) { //로그인 된 상태 확인
			System.out.println("접속중인 유저: " + user.getName());
			
			List<AccountDTO> accList = this.transService.getAccountList(user);
			System.out.println("=================================\n\n");
			System.out.println(accList);
			System.out.println("첫 번째 계좌의 계좌번호: " + accList.getFirst().getAccount_number());
			System.out.println("\n\n=================================");
			mv.addObject("accountList",accList);
		}
		
		
		mv.setViewName("transfer/transfer");
		return mv;
	}
	
	@PostMapping("transfer")
	public String transfer_ok(Long fromAccountId, Long toAccountId, long amount, String memo) {
		
		
		
		this.transService.transfer(fromAccountId, toAccountId, amount, memo);
		
		return "mypage/inquiry";
	}
}
