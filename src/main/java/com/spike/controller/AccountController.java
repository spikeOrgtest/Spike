package com.spike.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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

	@Autowired
	private PasswordEncoder passwordEncoder;

	// 상품 메인페이지
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

	@GetMapping("/products/deposit/subpage_d{number:\\d+}")
	public String depositSubpage(@PathVariable String number) {
		return "products/Subpage_D" + number;
	}

	@GetMapping("/products/savings/subpage_s{number:\\d+}")
	public String savingsSubpage(@PathVariable String number) {
		return "products/Subpage_S" + number;
	}

	@GetMapping("/products/newmember")
	public ModelAndView newmember(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (session.getAttribute("User") == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='/spike.com/login';");
			out.println("</script>");
			return null;
		}

		String[] account_type = { "입출금계좌", "투자계좌" };

		ModelAndView ss = new ModelAndView("/products/newmember");
		ss.addObject("account_type", account_type);
		return ss;
	}

	@GetMapping("/products/newdeposit")
	public ModelAndView newDeposit(HttpSession session, HttpServletResponse response,
			@RequestParam(required = false) String selectedProduct) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (session.getAttribute("User") == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='/spike.com/login';");
			out.println("</script>");
			return null;
		}

		String[] account_type = { "예금" };
		ModelAndView ss = new ModelAndView("/products/newDeposit");
		ss.addObject("account_type", account_type);
		ss.addObject("selectedProduct", selectedProduct);
		return ss;
	}

	@GetMapping("/products/newsavings")
	public ModelAndView newSavings(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (session.getAttribute("User") == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='/spike.com/login';");
			out.println("</script>");
			return null;
		}

		String[] account_type = { "적금" };
		ModelAndView ss = new ModelAndView("/products/newSavings");
		ss.addObject("account_type", account_type);
		return ss;
	}

	@PostMapping("/account_ok")
	public ModelAndView account_ok(AccountDTO s, HttpServletRequest request, BindingResult result,
			HttpSession session) {
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
		s.setOwner(sessionUser);
		s.setBalance(1000000L);
		s.setDayLimit(1000000L);
		s.setOneLimit(100000L);
		s.setAccountPassword(passwordEncoder.encode(s.getAccountPassword()));

		// 이자 관련 정보 추가
		s.setStartDate(LocalDateTime.now());
		s.setLastInterestDate(LocalDateTime.now());

		// 계좌 유형에 따른 이자율 설정
		if ("예금".equals(s.getAccountType())) {
			s.setInterestRate(3.5); // 예금 기본 이자율
		} else if ("적금".equals(s.getAccountType())) {
			s.setInterestRate(4.0); // 적금 기본 이자율
		}

		this.accountService.createAccount(s);
		return new ModelAndView("redirect:/spike.com/mypage/inquiry");
	}

	@PostMapping("/createAccount")
	public ModelAndView createAccount(AccountDTO s, HttpSession session) {
		try {
			UserDTO sessionUser = (UserDTO) session.getAttribute("User");
			s.setOwner(sessionUser);
			s.setBalance(1000000L);
			s.setDayLimit(1000000L);
			s.setOneLimit(100000L);
			s.setAccountPassword(passwordEncoder.encode(s.getAccountPassword()));

			// 이자 관련 정보 추가
			s.setStartDate(LocalDateTime.now());  // 계좌 생성시 시작일 설정
			s.setLastInterestDate(LocalDateTime.now());  // 마지막 이자 계산일 설정

			// 계좌 유형에 따른 이자율 설정
			if ("예금".equals(s.getAccountType())) {
				s.setInterestRate(3.5); // 예금 기본 이자율
			} else if ("적금".equals(s.getAccountType())) {
				s.setInterestRate(4.0); // 적금 기본 이자율
			}

			accountService.createAccount(s);
			return new ModelAndView("redirect:/spike.com/mypage/inquiry");
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("error");
		}
	}

}