package com.spike.controller;

import java.math.BigDecimal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.TransactionDTO;
import com.spike.service.TransactionServiece;

@Controller
@RequestMapping("/spike.com")
public class TransactionController {

	private TransactionServiece transService;
	
	@GetMapping("transfer")
	public String goTransfer() {
		
		return "transfer/transfer";
	}
	
	@PostMapping("transfer")
	public ModelAndView transfer_ok(Long fromAccountId, Long toAccountId, BigDecimal amount, String memo) {
		
		
		
		this.transService.transfer(fromAccountId, toAccountId, amount, memo);
		
		return null;
	}
}
