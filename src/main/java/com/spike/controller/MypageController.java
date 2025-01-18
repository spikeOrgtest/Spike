package com.spike.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.UserDTO;
import com.spike.service.UserSerivce;

import spikepwd.PwdChange;

@Controller
@RequestMapping("/spike.com/mypage")
public class MypageController {

	@Autowired
	private UserSerivce userService;

	@GetMapping("/main")
	public ModelAndView main(HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("User");

		String name = user.getName();
		String e_mail = user.getEmail_id();
		String e_mail2 = user.getEmail_domain();
		LocalDate Registrationdate = user.getRegistration_date();
		String phone = user.getPhone();
		String roadaddress = user.getRoadAddress();
		String detailaddress = user.getDetailAddress();
		LocalDate birthdate = user.getBirth_date();

		String[] email = { "gmail.com", "naver.com", "daum.net", "nate.com", "직접입력" };
		ModelAndView s = new ModelAndView();
		s.addObject("name", name);
		s.addObject("e_mail", e_mail);
		s.addObject("e_mail2", e_mail2);
		s.addObject("Registrationdate", Registrationdate);
		s.addObject("phone", phone);
		s.addObject("roadaddress", roadaddress);
		s.addObject("detailaddress", detailaddress);
		s.addObject("birthdate", birthdate);
		s.addObject("email", email);
		s.setViewName("/mypage/mypageMain");
		return s;
	}

	@PostMapping("profileEdit")
	public ModelAndView profileEdit(UserDTO s, HttpSession session) {

		// 세션에 저장된 객체 저장
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");

		String loginId = sessionUser.getLogin_id();
		s.setLogin_id(loginId);

		// 이메일 도메인 처리
		String email = s.getEmail_id() + "@" + s.getEmail_domain(); // 이메일 ID와 도메인을 합침
		if (email != null && !email.isEmpty()) {
			String[] emailParts = email.split("@");
			if (emailParts.length == 2) {
				s.setEmail_id(emailParts[0]);
				s.setEmail_domain(emailParts[1]); // email_domain 필드에 도메인 부분을 설정
			}
		}

		s.setPassword(PwdChange.getPassWordToXEMD5String(s.getPassword()));

		this.userService.profileEdit(s);

		// 세션에 저장된 객체에 바뀐 이름 저장(header.jsp 이름 변경 반영을 위함)
		sessionUser.setName(s.getName());
		session.setAttribute("User", sessionUser);

		return new ModelAndView("/mypage/mypageMain");
	}
}
