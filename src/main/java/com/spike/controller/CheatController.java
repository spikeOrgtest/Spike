package com.spike.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spike.dto.CheatDetaliDTO;
import com.spike.dto.CheatReportDTO;
import com.spike.dto.UserDTO;
import com.spike.service.CheatService;

@Controller
@RequestMapping("/spike.com/support")
public class CheatController {

	@Autowired
	private CheatService cheatservice;
	
	@GetMapping("/cheat")
	public String cheat() {
		
		return "support/cheat";
		
	}
	
	// 신고 저장
	@PostMapping("/cheat")
	public void cheatreview(HttpSession session , CheatReportDTO cr , CheatDetaliDTO cd , String detailType, String detailValue, String content) {
		
		UserDTO user = (UserDTO) session.getAttribute("User");
		
		cr.setReporterId(user);
		cr.setContent(content);
		cr.setStatus("Pending");
		
		this.cheatservice.saveContent(cr);
		
		cd.setDetailType(detailType);
		cd.setDetailValue(detailValue);
		cd.setReporterId(cr);
		cd.setCont(0L);
		
		this.cheatservice.saveDetail(cd);
		
	}
	
	
}
