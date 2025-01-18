package com.spike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {
	
	@GetMapping("/products")
    public String products() {
        return "products";
    }	
		
	@GetMapping("/deposit")
    public String deposit() {
        return "products/deposit";
    }
	
	@GetMapping("/savings")
	public String savings() {
		return "/products/savings";
	}
	
	@GetMapping("/loan")
	public String loan() {
		return "products/loan";
	}
	
	@GetMapping("/card")
	public String card() {
		return "products/card";
	}
	
	@GetMapping("/newmember")
	public String newmember() {
		return "products/newmember";
	}
}
