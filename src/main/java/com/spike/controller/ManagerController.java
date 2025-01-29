package com.spike.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.UserDTO;
import com.spike.service.ManagerService;
import com.spike.service.UserSerivce;

@Controller
@RequestMapping("/spike.com")
public class ManagerController {

	@Autowired
	private UserSerivce userService;

	@Autowired
	private ManagerService managerService;

	// @GetMapping("/ma")
	// public ModelAndView manager(HttpServletRequest request) {

	// ModelAndView m = new ModelAndView();
	// m.setViewName("/manager/manager");
	// return m;

	@GetMapping("/ma")
	public ModelAndView mapost() {
		System.out.println("mapost() 메서드가 호출됨");

		Long tolog = userService.todayloge();
		System.out.println("\n ==========================  " + tolog);

		Long newmember = userService.newMember();

		ModelAndView ma = new ModelAndView();
		ma.addObject("tolog", tolog); // 화면으로 전달할 데이터
		ma.addObject("newmember", newmember);
		ma.setViewName("/manager/manager");
		return ma;

	}

	@GetMapping("/userManagement")
	public ModelAndView userManagement() {

		List<UserDTO> list = this.userService.findByUserList();

		System.out.println("list : " + list);

		ModelAndView um = new ModelAndView("manager/userManagement");
		um.addObject("list", list);

		return um;
	}

}
