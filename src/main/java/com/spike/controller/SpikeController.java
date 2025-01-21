package com.spike.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spike.dto.UserDTO;
import com.spike.service.TestService;
import com.spike.service.UserSerivce;

@Controller
@RequestMapping("/spike.com")
public class SpikeController {
	
	@Autowired
	TestService testService;
	
	@Autowired
	private UserSerivce userService;
	
	@GetMapping("")
	public String showIndex(HttpSession session) {
	    // 세션에서 SecurityContext 가져오기
	    SecurityContext context = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");

	    if (context != null && context.getAuthentication() != null) {
	        String loginId = context.getAuthentication().getName();
	        System.out.println("context : " + context);
	        System.out.println("loginId :" + loginId);

	        if (loginId != null) {
	            // 로그인된 사용자 정보 가져오기
	            UserDTO u = this.userService.findFromSession(loginId);

	            // 세션에 UserDTO 객체 저장
	            session.setAttribute("User", u);
	            
				// 세션 만료 시간을 1시간으로 설정 (단위: 초)
				session.setMaxInactiveInterval(60 * 60); // 1시간
				session.setAttribute("remainingTime", session.getMaxInactiveInterval());

	        }
	    } else {
	        // 로그아웃 상태에서 처리
	        System.out.println("로그인 정보가 없습니다. 세션이 만료되었거나 로그아웃되었습니다.");
	    }
	    
	    return "index";
	}

	
	@GetMapping("hi")
	public String showMainpage() {
		return "login";
	}
	
}
