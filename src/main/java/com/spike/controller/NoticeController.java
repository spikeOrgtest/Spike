package com.spike.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.Notice2DTO;
import com.spike.dto.NoticeDTO;
import com.spike.service.NoticeService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	


	//공지사항 글쓰기
	@GetMapping("/noti_write")
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
	
	//자료실 저장
	@PostMapping("/noti_write_ok")
	public String noti_write_ok(NoticeDTO notice,Notice2DTO notice2, HttpServletRequest request) {
		String uploadFolder = request.getSession().getServletContext().getRealPath("upload");
		MultipartFile uploadFile = notice2.getUploadFile();
		System.out.println("========================"+uploadFile);
		if(!uploadFile.isEmpty()) {
			System.out.println(uploadFile.getOriginalFilename());
			System.out.println(uploadFile.getSize());
			
			String fileName = uploadFile.getOriginalFilename();
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR); //년도
			int month = cal.get(Calendar.MONTH)+1; //월값
			int date = cal.get(Calendar.DATE);//일값
			
			String homedir = uploadFolder + "/"+year+"-"+month+"-"+date;//오늘잘짜 폴더경로 저장
			File path01=new File(homedir);
			
			if(!(path01.exists())) {
				path01.mkdir();//오늘날짜 폴더 생성
			}
			Random r = new Random();//난수를 발생시키는 클래스
			int random = r.nextInt(100000000);//0이상 1억미만사이의 정수숫자 난수 발생
			
			/*첨부파일 확장자 구함*/
			int index = fileName.lastIndexOf(".");//첨부파일에서 .를 맨오른쪽부터 찾아서 가장 먼저 나오는 해당 문자위치번호를 맨왼쪽 첫문자
			//를 0부터 카운터해서 구한다
			String fileExtendsion = fileName.substring(index+1);//.이후부터 마지막 문자까지 구한다. 첨부파일 확장자를 구함.
			String refileName = "Notice"+year+month+date+random+"."+fileExtendsion;//새로운 첨부파일명을 구함.
			String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;//테이터베이스에 저장될 값
			
			notice.setNotice_file(fileDBName);
			
			File saveFile = new File(homedir+"/"+refileName);
			
			try {
				uploadFile.transferTo(saveFile);//upload폴더에 오늘날짜로 새롭게 생성된 폴더에 변경된 첨부파일명으로 실제 업로드
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else {//첨부파일이 없는 경우
			String fileDBName = "";
			notice.setNotice_file(fileDBName);
		}
		
		this.noticeService.insertnotice(notice);//자료실 저장
		
		return "redirect:/support/newsSubpage_notice";//새로운 매핑주소인 자료실 목록으로 이동
	}//bbs_write_ok()
	  
	/*연습페이지*/
	@GetMapping("/notice")
	public ModelAndView notice(HttpServletRequest request) {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/support/newsSubpage_notice");
		return m;
	}
}
	
	

