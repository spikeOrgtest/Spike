package com.spike.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spike.service.TestService;

@Controller
@RequestMapping("/spike.com")
public class SpikeController {
	
	@Autowired
	TestService testService;
	
	@GetMapping("")
	public String showIndex() {
		return "index";
	}
	
	@GetMapping("hi")
	public String showMainpage() {
		return "login";
	}
	
}
