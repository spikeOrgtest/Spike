package com.spike.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.CardDTO;
import com.spike.dto.UserDTO;
import com.spike.service.CardService;

@Controller
@RequestMapping("/spike.com")
public class CardController {

	@Autowired
	private CardService cardService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
		
	@GetMapping("/products/card")
	public String card() {
		return "products/card";
	}
		
	@GetMapping("/products/card/subpage_c{number:\\d+}")
	public String cardSubpage(@PathVariable String number) {
		return "products/Subpage_C" + number;
	}
	
		
	@GetMapping("/products/newcard")
	public ModelAndView newCard(HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if (session.getAttribute("User") == null) {
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='/spike.com/login';");
			out.println("</script>");
			return null;
		}
		
		String[] card_name = {
			"SPIKE 청년 카드",
			"플래티넘 카드",
			"디지털 카드",
			"SPIKE 카드",
			"SPIKE TRAVEL 카드",
			"플러스 카드"
		};
		
		ModelAndView ss = new ModelAndView("/products/newCard");
		ss.addObject("card_name", card_name);
		return ss;
	}
	
	@PostMapping("/card_ok")
	public ModelAndView card_ok(CardDTO s, HttpServletRequest request, 
			BindingResult result, HttpSession session) throws IOException {
		if (session.getAttribute("User") == null) {
			return new ModelAndView("redirect:/spike.com/login");
		}
		
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
		s.setOwner(sessionUser);
		s.setCard_password(passwordEncoder.encode(s.getCard_password()));
		this.cardService.createCard(s);
		
		return new ModelAndView("redirect:/spike.com/products");
	}	
}