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
	/*
	 * // 계좌 개설 페이지로 이동
	 * 
	 * @GetMapping("/products/newmember") public String newmember() { return
	 * "/products/newmember"; }
	 */

	/*
	 * @PostMapping("products/newmember/account") public String
	 * createAccount(@RequestParam("password") String password,
	 * 
	 * @RequestParam("accountType") String accountType,
	 * 
	 * @RequestParam("userId") Long userId, // userId는 필요시 세션 등에서 가져옴 Model model) {
	 * 
	 * // 계좌 객체 생성 AccountDTO accountDTO = new AccountDTO();
	 * accountDTO.setAccount_password(password);
	 * accountDTO.setAccount_type(accountType); accountDTO.setUser_id(userId);
	 * accountDTO.setBalance("0"); // 초기 잔액 설정 accountDTO.setCreated_date(new
	 * Timestamp(System.currentTimeMillis()));
	 * accountDTO.setUpdate_date(LocalDate.now());
	 * 
	 * // 계좌 생성 서비스 호출 boolean isAccountCreated =
	 * accountService.createAccount(accountDTO);
	 * 
	 * if (isAccountCreated) { model.addAttribute("message", "계좌가 성공적으로 생성되었습니다.");
	 * return "accountList"; // 성공시 계좌 생성 완료 페이지로 리다이렉트 } else {
	 * model.addAttribute("message", "계좌 생성에 실패했습니다. 다시 시도해주세요."); return
	 * "accountFailure"; // 실패시 오류 페이지로 리다이렉트 } }
	 */

	// 계좌개설 폼
	@GetMapping("/products/newmember")
    public ModelAndView newmem() {
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
	
	@PostMapping("/save")
    public String accountList(@RequestParam("account_password") String account_password,
                               @RequestParam("account_type")String account_type) {
                               
        accountList(account_password, account_type);//폼 데이터 처리하기
        
        return "redirect:/products/accountList";
    }

    //성공 시 contactcomplete.html 페이지 보여주기
    @GetMapping("/success")
    public String showSuccessPage() {
        return "accountList";
    }
}