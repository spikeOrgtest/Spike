package com.spike.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.service.AccountService;

@Controller
@RequestMapping("/spike.com/*")
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	//상품 메인페이지
	@GetMapping("/products")
    public String products() {
        return "products";
    }	
		
	@GetMapping("/products/deposit")
    public String deposit() {
        return "products/deposit";
    }
	
	@GetMapping("/products/savings")
	public String savings() {
		return "products/savings";
	}
	
	@GetMapping("/products/loan")
	public String loan() {
		return "products/loan";
	}
	
	@GetMapping("/products/card")
	public String card() {
		return "products/card";
	}
	
	// 계좌개설 폼
	@GetMapping("/products/newmember")
    public ModelAndView newmember() {
        String[] account_type = {"예금", "적금"};
        
        ModelAndView ss = new ModelAndView("/products/newmember");
        ss.addObject("account_type", account_type);
        return ss;
    }

	@GetMapping("/products/newdeposit")
	public ModelAndView newDeposit() {
		String[] account_type = {"예금"};
		
		ModelAndView ss = new ModelAndView("/products/newDeposit");
		ss.addObject("account_type", account_type);
		return ss;
	}
	
	@GetMapping("/products/newsavings")
	public ModelAndView newSavings() {
		String[] account_type = {"적금"};
		
		ModelAndView ss = new ModelAndView("/products/newSavings");
		ss.addObject("account_type", account_type);
		return ss;
	}
	
	@PostMapping("/account_ok")
    public ModelAndView account_ok(AccountDTO s, 
    		HttpServletRequest request, BindingResult result) throws IOException {
    	
		this.accountService.createAccount(s);
		
    	return new ModelAndView("redirect:/spike.com/products");
    }
	
}