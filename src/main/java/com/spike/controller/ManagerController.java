package com.spike.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

		Long tolog = userService.todaylog();
		System.out.println("\n ==========================  " + tolog);

		Long newmember = userService.newMember();

		ModelAndView ma = new ModelAndView();
		ma.addObject("tolog", tolog); // 화면으로 전달할 데이터
		ma.addObject("newmember", newmember);
		ma.setViewName("/manager/manager");
		return ma;

				
	}
	
	@GetMapping("/visit")
	public ModelAndView visit() {
		
		List<UserDTO> visi = this.userService.findByUserList();
		
		List<UserDTO> Llist = visi.stream()
				.filter(l -> l.getLastLogin() != null && l.getLastLogin().toLocalDate().isEqual(LocalDate.now()))
				.collect(Collectors.toList());
		
		//if(visi.getLastLogin().equals(LocalDateTime.now())) {
		
		ModelAndView vi = new ModelAndView();
		vi.addObject("visi",visi);
		vi.addObject("Llist",Llist);
		vi.setViewName("/manager/visit");
		return vi;
	}
			
	

	@GetMapping("/userManagement")
	public ModelAndView userManagement() {

		List<UserDTO> list = this.userService.findByUserList();

		ModelAndView um = new ModelAndView("manager/userManagement");
		um.addObject("list", list);

		return um;
	}

	@GetMapping("/EditUser")
	public ModelAndView EditUser(@RequestParam("userId") Long UserId) {

		List<UserDTO> list = this.userService.findByUserIdEdit(UserId);

		System.out.println("list : " + list);

		ModelAndView em = new ModelAndView("manager/EditUser");
		em.addObject("list", list);

		return em;
	}

	@PostMapping("/UpdateUser")
	public void UpdateUser(Long userId, String isMinor, String status, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		System.out.println(userId);
		System.out.println(isMinor);
		System.out.println(status);

		this.userService.UpdateUser(isMinor, status, userId);

		out.println("<script>");
		out.println("alert('수정 완료했습니다.');");
		out.println("window.location.href = '/spike.com/userManagement';");
		out.println("</script>");

	}

	@GetMapping("/DeleteUser")
	public void DeleteUser(@RequestParam("userId") Long UserId, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		List<String> list = this.userService.findbyaccountnumber(UserId);

		System.out.println("list : " + list);

		if (list.size() == 0) {
			this.userService.UserDelete(UserId);
			out.println("<script>");
			out.println("alert('삭제 완료했습니다.');");
			out.println("window.location.href = '/spike.com/userManagement';");
			out.println("</script>");
		} else {
			this.userService.AccountDelete(UserId);
			this.userService.UserDelete(UserId);
			out.println("<script>");
			out.println("alert('삭제 완료했습니다.');");
			out.println("window.location.href = '/spike.com/userManagement';");
			out.println("</script>");
		}

	}


}
