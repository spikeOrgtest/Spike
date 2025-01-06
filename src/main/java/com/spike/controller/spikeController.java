package com.spike.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.spikeDTO;
import com.spike.service.spikeSerivce;

@Controller
public class spikeController {

	@Autowired 
	private spikeSerivce spikeService;
	
	// 로그인
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView s = new ModelAndView();
		s.setViewName("/login");
		return s;
	}
	
	// 회원가입
	@GetMapping("/signup")
	public ModelAndView signup() {
		
		String[] phone = {"010","011","019"};
		String[] email = {"gmail.com","naver.com","daum.net","nate.com","직접입력"};
		
		ModelAndView ss = new ModelAndView("/signup");
		
		ss.addObject("phone", phone);
		ss.addObject("email", email);
		return ss;
	}
	
	//아이디 중복 검색
	/*@PostMapping("/signup_idcheck")
	public ModelAndView signup_idcheck(String id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		spikeDTO ds = this.spikeService.idCheck(id);
		
		int re = -1;
		
		if(ds != null) {
			re = 1;
		}
		out.println(re);
		return null;
	}*/
	
	@PostMapping("/signup_ok")
	public ModelAndView signup_ok(spikeDTO s) {
		
		this.spikeService.insertMember(s);
		
		return new ModelAndView("/login");
	}
	
}
