package com.spike.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spike.service.ManagerService;
import com.spike.service.UserSerivce;



@Controller
@RequestMapping("/spike.com")
public class ManagerController {
	
	@Autowired
	private UserSerivce userService;
	
	@Autowired
	private ManagerService managerService;
	  
		 
	//@GetMapping("/ma")
	//public ModelAndView manager(HttpServletRequest request) {
			
	//	ModelAndView m = new ModelAndView();
	//	m.setViewName("/manager/manager");
	//	return m;
	        
 
	
	@GetMapping("/ma")
	public ModelAndView mapost() {
		System.out.println("mapost() 메서드가 호출됨");
		
		Long tolog = userService.todayloge();
		System.out.println("\n ==========================  " + tolog);
		
		
		ModelAndView ma = new ModelAndView();
		ma.addObject("tolog", tolog);  // 화면으로 전달할 데이터
	    ma.setViewName("/manager/manager");
		return ma;
				
	}
	
	//@GetMapping("/visit")
	//public ModelAndView visit() {
	//	
	//	int visi = userService.visitors();
	//	System.out.println("\n =============== " + visi);
	//	
	//	ModelAndView vi = new ModelAndView();
	//	vi.addObject("visi",visi);
	//	vi.setViewName("/manager/visit");
	//	return vi;
	//}
	
	//("/visit")
	//public String loan() {
	//	return "/manager/visit";
	//}
	

}
