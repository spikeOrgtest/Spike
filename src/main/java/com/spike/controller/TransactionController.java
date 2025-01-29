package com.spike.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.dto.TransferDTO;
import com.spike.dto.UserDTO;
import com.spike.service.TransactionService;
import com.spike.service.UserSerivce;

@Controller
@RequestMapping("/spike.com")
public class TransactionController {
	
	@Autowired
	private UserSerivce userService;
	
	@Autowired
	private TransactionService transService;
	
	@GetMapping("transfer")
	public ModelAndView transferPage(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		UserDTO user = (UserDTO)session.getAttribute("User");
		if(user != null) { //로그인 된 상태 확인
			List<AccountDTO> accList = this.transService.getAccountList(user);
			if(accList != null) mv.addObject("accountList",accList);
		}
		
		mv.setViewName("transfer/transfer");
		return mv;
	}
	
	@PostMapping("transfer_ok")
	public String transfer_ok(Long fromAccountId, String toAccount, long amount, String memo, String accountPassword, HttpSession session) {
		//받는 사람의 이름 조회
		String toAccOwner = this.transService.getOwnerName(toAccount); 
		
		//데이터 전송 객체(DTO)에 폼에서 받아온 정보 저장 후 세션에 DTO 객체 저장
		TransferDTO tData = new TransferDTO(fromAccountId, toAccount, amount, memo, accountPassword, toAccOwner);
		session.setAttribute("Data", tData);
		
		//송금 확인 뷰페이지 렌더링
		return "transfer/transfer_ok";
//		System.out.println("fromAccountId: "+fromAccountId + "\ntoAccount: "+toAccount +"\namount: "+amount);
//		
//		this.transService.transfer(fromAccountId, toAccount, amount, memo, accountPassword);
//		
//		return "redirect:/spike.com/mypage/main";
	}
	
	@PostMapping("transfer")
	public void transfer(HttpSession session) {
		
		TransferDTO tData = (TransferDTO) session.getAttribute("Data");
		System.out.println(tData);
		this.transService.transfer(tData);
	}
}
