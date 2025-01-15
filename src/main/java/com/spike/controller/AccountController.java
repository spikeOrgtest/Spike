package com.spike.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spike.dto.AccountDTO;
import com.spike.service.AccountService;

@Controller
@RequestMapping("/spike.com")
public class AccountController {

	private final AccountService accountService;

    // 생성자 주입
    @Autowired
    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }
	
    // 계좌 개설 페이지로 이동
    @GetMapping("/newmember")
    public String showNewMemberPage() {
        return "/products/newmember";  // newmember.jsp 파일을 반환
    }
    
    @PostMapping("/newmember")
    public String createAccount(@ModelAttribute AccountDTO accountDTO) {
        try {
            // 서비스 계층에 전달하여 DB에 저장
            accountService.createAccount(accountDTO);
            return "redirect:/products";  // 성공 페이지로 리다이렉트
        } catch (Exception e) {
            // 예외 처리
            return "redirect:/products/failure";  // 실패 페이지로 리다이렉트
        }
    }
}