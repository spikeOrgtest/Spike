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
	
	// 계좌개설 폼
	@GetMapping("/products/newmember")
    public ModelAndView newmember() {
        String[] account_type = {"예금", "적금"};
        
        ModelAndView ss = new ModelAndView("/products/newmember");
        ss.addObject("account_type", account_type);
        return ss;
    }

	@PostMapping("/account_ok")
    public ModelAndView account_ok(AccountDTO s, 
    		HttpServletRequest request, BindingResult result) throws IOException {
    	
		this.accountService.createAccount(s);
		
    	return new ModelAndView("redirect:/spike.com/login");
    }
	/*
	@PostMapping("/save")
    public String accountList(@RequestParam("account_password") String account_password,
                               @RequestParam("account_type")String account_type) {
                               
        accountList(account_password, account_type);//폼 데이터 처리하기
        
        return "redirect:/products/accountList";
    }

    //성공 시 html 페이지 보여주기
    @GetMapping("/success")
    public String showSuccessPage() {
        return "/products/accountList";
    }
    */
}