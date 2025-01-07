package com.spike.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/notice")
	public ModelAndView notice(HttpServletRequest request) {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/support/newSubpage_noticeDetail");
		return m;
	}

	//공지사항 글쓰기
	@GetMapping("noti_write")
	public ModelAndView noti_write(HttpServletRequest request) {
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			
		}
		ModelAndView wm = new ModelAndView();
		wm.setViewName("noti/noti_write");
		wm.addObject("page",page);
		return wm;
	} //noti_write()
}
