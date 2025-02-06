package com.spike.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.dto.CheatReportDTO;
import com.spike.dto.UserDTO;
import com.spike.service.AccountService;
import com.spike.service.CheatService;

@Controller
@RequestMapping("/spike.com/support")
public class CheatController {

	@Autowired
	private CheatService cheatservice;
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/cheat")
	public String cheat() {
		
		return "support/cheat";
		
	}
	
	// 신고 저장
	@PostMapping("/cheat")
	public void cheatreview(HttpSession session , CheatReportDTO cr, String detailType, String detailValue, String content) {
		
		List<AccountDTO> list = this.accountService.findbyAccountInfo(detailValue);
		
		for(AccountDTO account : list) {
			System.out.println(account.getAccountNumber());
		}
		
		//this.cheatservice.saveContent(cr);
	}
	
	@PostMapping("/search")
	public ModelAndView cheatSearch(String detailValue) {
		
		//List<CheatDetaliDTO> detaillist = this.cheatservice.findByCheat(detailValue);
		
		ModelAndView cs = new ModelAndView("support/cheatsearch");
		//cs.addObject("detaillist", detaillist);
		
		return cs;
	}
	
	
}
