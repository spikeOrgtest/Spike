package com.spike.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/spike.com")
public class ManagerController {
	  
		 
	@GetMapping("/ma")
	public ModelAndView notice(HttpServletRequest request) {
			
		ModelAndView m = new ModelAndView();
		m.setViewName("/manager/manager");
		return m;
	        
 }
}
