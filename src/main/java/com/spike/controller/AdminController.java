package com.spike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/spike.com")
public class AdminController {

	
	@GetMapping("/admin")
	public ModelAndView admin() {
		ModelAndView s = new ModelAndView();
		s.setViewName("/admin/admin");
		return s;
	}
}
