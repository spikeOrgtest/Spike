package com.spike.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;

import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.CheatReportDTO;
import com.spike.dto.ManagerDTO;
import com.spike.dto.UserDTO;
import com.spike.service.LoginHistoryService;
import com.spike.service.UserSerivce;
import com.spike.dto.LoanDTO;
import com.spike.service.LoanService;


@Controller
@RequestMapping("/spike.com/admin")
public class ManagerController {

	@Autowired
	private UserSerivce userService;

	@Autowired
    private LoginHistoryService loginHistoryService;

	@Autowired
	private LoanService loanService;

	// @GetMapping("/ma")
	// public ModelAndView manager(HttpServletRequest request) {

	// ModelAndView m = new ModelAndView();
	// m.setViewName("/manager/manager");
	// return m;

	@GetMapping("/ma")
	public ModelAndView mapost() {

		Long tolog = userService.todaylog();
		Long newmember = userService.newMember();
		Long allvisit = userService.getallvisit();
		Long allamount = userService.getallamount();
		Long allTransaction = userService.getallTransaction();
		Long allLoanId = userService.getallLoanId();
		Long allloanAmount = userService.getallloanAmount();

		ModelAndView ma = new ModelAndView();
		ma.addObject("tolog", tolog); // 화면으로 전달할 데이터
		ma.addObject("newmember", newmember);
		ma.addObject("allvisit",allvisit);
		ma.addObject("allamount",allamount);
		ma.addObject("allTransaction",allTransaction);
		ma.addObject("allLoanId", allLoanId);
		ma.addObject("allloanAmount",allloanAmount);
		ma.setViewName("/manager/manager");
		return ma;

	}
			
	@GetMapping("/visit")
	public ModelAndView visit(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "5") int size) {
		
		Pageable visipage = PageRequest.of(page-1, size, Sort.by("userId").descending());
		
		Page<UserDTO> Todaylist = userService.getTodaylist(visipage);
		
		ModelAndView vi = new ModelAndView();
		vi.addObject("Todaylist", Todaylist);
		vi.setViewName("/manager/visit");
		return vi;
	}
	//설 로그인시간보는것
	
	
	@GetMapping("/userLoginHistory")
	public ModelAndView userLoginHistory(@RequestParam("userId") Long UserId,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int size) {
		
		//페이징 객체설정
		Pageable pageable = PageRequest.of(page-1, size, Sort.by("allTime").descending());
		
		// 로그인 기록 조회(페이징까지)
		Page<ManagerDTO> LHlist = loginHistoryService.findByLoginIdday(UserId,pageable);
		
		// ModelAndView 객체 생성
		ModelAndView mv = new ModelAndView("manager/userLoginHistory");
		
		mv.addObject("LHlist",LHlist);
		mv.addObject("userId", UserId);
		// ModelAndView 반환
		return mv;
	}

	@GetMapping("/userManagement")
	public ModelAndView userManagement(@RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size) {

		//List<UserDTO> list = this.userService.findByUserList();
		
		Page<UserDTO> paging = this.userService.findByUserList(page, size);

		ModelAndView um = new ModelAndView("manager/userManagement");
		um.addObject("paging", paging);
	    um.addObject("totalPages", paging.getTotalPages());
	    um.addObject("totalElements", paging.getTotalElements());
	    um.addObject("currentPage", page);
	    um.addObject("pageSize", size);

		return um;
	}
	
	@GetMapping("/EditUser")
	public ModelAndView EditUser(@RequestParam("userId") Long UserId) {

		List<UserDTO> list = this.userService.findByUserIdEdit(UserId);

		ModelAndView em = new ModelAndView("manager/EditUser");
		em.addObject("list", list);

		return em;
	}

	@PostMapping("/UpdateUser")
	public void UpdateUser(Long userId, String isMinor, String status, String roles, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		this.userService.UpdateUser(isMinor, status, roles, userId);

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

		if (list.size() == 0) {
			this.userService.UserDelete(UserId);
			out.println("<script>");
			out.println("alert('삭제 완료했습니다.');");
			out.println("window.location.href = '/spike.com/admin/userManagement';");
			out.println("</script>");
		} else {
			this.userService.AccountDelete(UserId);
			this.userService.UserDelete(UserId);
			out.println("<script>");
			out.println("alert('삭제 완료했습니다.');");
			out.println("window.location.href = '/spike.com/admin/userManagement';");
			out.println("</script>");
		}
	}
}



