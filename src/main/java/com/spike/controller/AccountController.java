package com.spike.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;
import com.spike.service.AccountService;

@Controller
@RequestMapping("/spike.com")
public class AccountController {

	@Autowired
	private AccountService accountService;

    // 계좌 개설 페이지로 이동
    @GetMapping("products/newmember")
    public String showNewMemberPage() {
        return "spike.com/products";
    }
    
    @PostMapping("/newmember")
    public String createAccount(@RequestParam("password") String password,
                                @RequestParam("accountType") String accountType,
                                @RequestParam("userId") Long userId,  // userId는 필요시 세션 등에서 가져옴
                                Model model) {

        // 계좌 객체 생성
        AccountDTO accountDTO = new AccountDTO();
        accountDTO.setAccount_password(password);
        accountDTO.setAccount_type(accountType);
        accountDTO.setUser_id(userId);
        accountDTO.setBalance("0");  // 초기 잔액 설정
        accountDTO.setCreated_date(new Timestamp(System.currentTimeMillis()));
        accountDTO.setUpdate_date(LocalDate.now());

        // 계좌 생성 서비스 호출
        boolean isAccountCreated = accountService.createAccount(accountDTO);

        if (isAccountCreated) {
            model.addAttribute("message", "계좌가 성공적으로 생성되었습니다.");
            return "accountSuccess";  // 성공시 계좌 생성 완료 페이지로 리다이렉트
        } else {
            model.addAttribute("message", "계좌 생성에 실패했습니다. 다시 시도해주세요.");
            return "accountFailure";  // 실패시 오류 페이지로 리다이렉트
        }
    }
    
}