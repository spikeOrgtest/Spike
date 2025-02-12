package com.spike.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.dto.CheatReportDTO;
import com.spike.dto.UserDTO;
import com.spike.service.AccountService;
import com.spike.service.CheatService;

@Controller
@RequestMapping("/spike.com/support")
public class CheatController {

	@Autowired
	private CheatService cheatservice;
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/cheat")
	public ModelAndView cheat(HttpSession session) {
		UserDTO User = (UserDTO) session.getAttribute("User");
		
		ModelAndView cv = new ModelAndView("support/cheat");
		
		cv.addObject("User", User);
		
		return cv;
		
	}
	
	// 신고 저장
	@PostMapping("/cheat")
	public void cheatreview(CheatReportDTO cr, String detailValue, String content, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserDTO User = (UserDTO) session.getAttribute("User");
		UserDTO owner = null;
		
		List<AccountDTO> list = this.accountService.findbyAccountInfo(detailValue);
		
		if(!list.isEmpty()) {
			for(AccountDTO account : list) {
				owner = account.getOwner();
				if(User == owner) {
				cr.setAccountId(account);
				cr.setReportValue(detailValue);
				cr.setContent(content);
				cr.setReportType("Account");
				cr.setStatus("pending "); // 디폴트값으로 미결정
				
				this.cheatservice.saveContent(cr);
				
				out.println("<script>");
				out.println("alert('신고 접수 완료했습니다.');");
				out.println("window.location.href='/spike.com/support/cheat'");
				out.println("</script>");
				break;
				} else {
					out.println("<script>");
					out.println("alert('본인의 계좌는 신고할 수 없습니다.');");
					out.println("window.location.href='/spike.com/support/cheat'");
					out.println("</script>");
					break;
				}
			}
		}
		
		out.println("<script>");
		out.println("alert('존재하지 않는 계좌번호입니다.');");
		out.println("window.location.href='/spike.com/support/cheat'");
		out.println("</script>");
	}
	
	@GetMapping("/search")
	public ModelAndView cheatSearch(String detailValue, @RequestParam(defaultValue = "0") int page, @RequestParam(defaultValue = "5") int size, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		Page<CheatReportDTO> paging = this.cheatservice.findByreportValue(detailValue, page, size);

		if(!paging.isEmpty()) {

			ModelAndView cs = new ModelAndView("support/cheatsearch");
			cs.addObject("paging", paging);

			cs.addObject("totalPages", paging.getTotalPages());
			cs.addObject("totalElements", paging.getTotalElements());
			cs.addObject("currentPage", page);
			cs.addObject("pageSize", size);

			return cs;
		}
		
		out.println("<script>");
		out.println("alert('존재하지 않는 계좌번호입니다.');");
		out.println("window.location.href='/spike.com/support/cheat'");
		out.println("</script>");

		return null;
	}
	
	
}
