package com.spike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/spike.com")
public class TransactionController {

	@GetMapping("transfer")
	public String goTransfer() {
		
		return "transfer/transfer";
	}
}
