package com.spike.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.NotiPageDTO;
import com.spike.dto.Notice2DTO;
import com.spike.dto.NoticeDTO;
import com.spike.service.NoticeService;

@Controller
@ControllerAdvice
@RequestMapping("/spike.com")
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
		
		return "redirect:/spike.com/notice";//새로운 매핑주소인 자료실 목록으로 이동
	}//bbs_write_ok()
	  
	/*연습페이지*/
	/*@GetMapping("/notice")
	public ModelAndView notice(HttpServletRequest request) {
		
		ModelAndView m = new ModelAndView();
		m.setViewName("/support/newsSubpage_notice");
		return m;
	}*/
	
	
	//검색기능 자료실 페이지목록
	@RequestMapping(value="/notice", method=RequestMethod.GET)
	public ModelAndView notice_list(HttpServletRequest request, NoticeDTO notice, NotiPageDTO p ) {
		int page=1;
		int limit=5;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			
		}
		// 검색 조건 설정
		String find_name = request.getParameter("find_name"); //검색어
		String find_field = request.getParameter("find_field"); // 검색필드
		
		//검색어와 필드를 dto에 셋팅
		p.setFind_field(find_field);
		p.setFind_name("%"+find_name+"%");
		
		//전체 게시물 수 구하기
		int totalCount = this.noticeService.getRowCount(p);
		
		//시작페이지와 끝페이지 계산
		p.setStartrow((page-1)*limit +1); //시작행 번호
		p.setEndrow(p.getStartrow()+limit-1); //끝행 번호
		
		//게시물 목록 가져오기
		List<NoticeDTO> Nlist = this.noticeService.getNotiList(p);
		
		int maxpage = (int) Math.ceil((double) totalCount / limit); // 총페이지수
		int startpage = ((page - 1) / 5) * 5 + 1;  // 시작 페이지
		int endpage = startpage + 4;
		//int startpage = ((page - 1) / 5) * 5 + 1;  // 시작 페이지 번호 계산
		//int endpage = startpage + 4;  // 끝 페이지 번호는 시작 페이지 + 4 (5개씩 보이게 하니까)
		if (endpage > maxpage) {
		    endpage = maxpage;  // 만약 끝 페이지가 총 페이지 수보다 크면 끝 페이지를 maxpage로 설정
		    
		}
		System.out.println("startpage: " + startpage);
		System.out.println("endpage: " + endpage);
		//if(endpage>startpage+5-1) endpage = startpage+5-1;
		
		ModelAndView listP = new ModelAndView();
		
		listP.addObject("page",page);
		listP.addObject("Nlist",Nlist);
		listP.addObject("startpage",startpage);
		listP.addObject("endpage",endpage);
		listP.addObject("maxpage",maxpage);
		listP.addObject("totalCount",totalCount);
		listP.addObject("find_field",find_field);
		listP.addObject("find_name",find_name);
		
		listP.setViewName("support/newsSubpage_notice"); 
		return listP;
		
	}//notice_list
	
	// ============================================================================
	
	//내용보기(조회수증가)+답변폼+수정폼+삭제폼
		@RequestMapping("/noti_cont")
		public ModelAndView notice_cont(Long notice_no, String state, Integer page, NoticeDTO n)  {
			
			if(state.equals("cont")) {//내용보기 일때만 조회수 증가
				n = this.noticeService.getNoticeCont(notice_no);
			}else {//내용보기가 아닌 경우 답변폼,수정폼,삭제폼일때는 조회수 증가 안함.
				n = this.noticeService.getNoticeCont2(notice_no);
			}
			String noti_cont = n.getNotice_cont().replace("\n", "<br/>");
			//textarea에서 엔터키를 친 부분을 줄바꿈 한다.
			System.out.println("테스트<=======================================");
			System.out.println(n.getNotice_cont());
			
			ModelAndView co = new ModelAndView();
			co.addObject("n", n);
			co.addObject("noti_cont", noti_cont);
			co.addObject("page", page);//책갈피 기능때문에 page키이름에 쪽번호 저장
			//co.setViewName("support/newSubpage_noticeDetail");
			//ModelAndView sk = new ModelAndView();
			//sk.addObject("notice",notice);
			//sk.addObject("noti_cont", noti_cont);
			//sk.setViewName("/support/newSubpage_noticeDetail");
			//sk.addObject("page",page);
			
			
			
			if(state.equals("cont")) {//내용보기 일때
				co.setViewName("/support/newSubpage_noticeDetail");//뷰페이지 경로=>/WEB-INF/views/bbs/bbs_cont.jsp
			} else if(state.equals("edit")) {//수정폼일때
				co.setViewName("noti/noti_edit");
			}else {//state=del일때 즉 삭제폼일때
				co.setViewName("noti/noti_del");
			}
			
			return co;
			//return sk;
		}//bbs_cont()

		/*
		//답변 저장
		@PostMapping("/bbs_reply_ok")
		public String bbs_reply_ok(BbsVO rb,int page) {
			/* BbsVO rb는 네임피라미터 이름과 빈클래스 변수명이 같으면 rb객체에 히든값과 입력필드 값이 저장되어 있다.하지만 page는 빈클래스에 변수명
			 * 으로 지정되어 있지 않기 때문에 int page로 별도로 페이지번호를 가져와야 한다.
			 
			this.bbsService.replyBbs(rb);//답변 저장
			return "redirect:/bbs/bbs_list?page="+page;//?page=쪽번호를 get방식으로 전달해서 페이징에서 책갈피 기능을 구현한다.
		}//noti_reply_ok()
		*/
		
		//공지사항 수정
		@RequestMapping(value="/noti_edit_ok",method=RequestMethod.POST) //post로 접근하는 매핑주소를 처리
		public ModelAndView noti_edit_ok(NoticeDTO notice,Notice2DTO notice2, HttpServletRequest request,HttpServletResponse response)
		throws Exception{
			response.setContentType("text/html;charset=UTF-8");//웹브라우저 출력되는 문자와태그,언어코딩 타입을 UTF-8로 지정
			PrintWriter out =response.getWriter();
			String uploadFolder = request.getSession().getServletContext().getRealPath("upload");
			//수정 첨부된 파일이 업로드 될 upload 폴더 실제 경로를 반환
			File uploadDir = new File(uploadFolder);
			if (!uploadDir.exists()) {
			    uploadDir.mkdirs(); // 경로가 없으면 폴더 생성
			}
			
			int page=1;
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
			
			
			NoticeDTO db_pwd = this.noticeService.getNoticeCont2(notice.getNotice_no());//조회수가 증가되지 않은 상태에서 오라클로 DB로 부터 비번을
			//가져온다.
			
			/*
			if(!db_pwd.getBbs_pwd().equals(bbs.getBbs_pwd())) {
				out.println("<script>");
				out.println("alert('비번이 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {*/
			
				MultipartFile uploadFile = notice2.getUploadFile();//첨부된 파일을 가져온다.
				
				if(!uploadFile.isEmpty()) {//수정 첨부파일이 있는 경우
					String fileName = uploadFile.getOriginalFilename();//수정 첨부된 원본파일명를 구함
					File delFile = new File(uploadFolder + db_pwd.getNotice_file());//삭제할 파일 객체 생성
					if(delFile.exists()) {//기존 삭제할 파일이 있다면
						delFile.delete();//기존 첨부파일만 삭제
					}
					Calendar cal = Calendar.getInstance();
					int year = cal.get(Calendar.YEAR); // 몇년도 인지
					int month = cal.get(Calendar.MONTH)+1; // 몇월 인지
					int date= cal.get(Calendar.DATE); // 몇일 인지
					
					String homedir = uploadFolder+"/"+year+"-"+month+"-"+date;
					File path01=new File(homedir);
					if(!(path01.exists())) {
						path01.mkdir();//오늘 날짜 폴더 생성
					}
					Random r=new Random();
					int random = r.nextInt(100000000);
					
					/*첨부파일 확장자를 구함*/
					int index = fileName.lastIndexOf(".");//마침표 위치번호를 구함
					String fileExtendsion = fileName.substring(index+1);//.이후부터 마지막 문자까지 구함=>결국 수정첨부파일 확장자만 구
					//함
					String refileName = "notice"+year+month+date+random+"."+fileExtendsion;//변경된 첨부파일명
					String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;//오라클에 저장된 레코드 값
					
					notice.setNotice_file(fileDBName);
					
					File saveFile = new File(homedir+"/", refileName);
					try {
						uploadFile.transferTo(saveFile);//upload 폴더에 오늘날짜 생성된 폴더에 변경된 파일로 실제 업로드 함.
					}catch(Exception e) {
						e.printStackTrace();
					}
				}else {//수정 첨부파일이 없는 경우
					String fileDBName = "";
					if(db_pwd.getNotice_file() != null) {//기존 첨부파일이 있는 경우
						notice.setNotice_file(db_pwd.getNotice_file());
					}else {
						notice.setNotice_file(uploadFolder);
					}
				}//if else
				
				this.noticeService.editNoti(notice);//자료실 수정

				ModelAndView em = new ModelAndView("redirect:/support/newSubpage_noticeDetail");
				em.addObject("notice_no", notice.getNotice_no());
				em.addObject("page", page);
				em.addObject("state", "cont");
				return em; //주소창에 노출되는 get방식으로 다음과 같이 전달된다. bbs_cont?bbs_no=번호&page=쪽번호&state=cont
		

			//return null;
		//noti_edit_ok()
}
		
		//자료실 삭제
		@RequestMapping("/noti_del_ok") //get or post방식으로 전송되는 매핑주소 처리
		public String noti_del_ok(Long notice_no, int page,
		HttpServletResponse response,HttpServletRequest request) throws Exception{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String delFolder = request.getSession().getServletContext().getRealPath("upload");//upload 실제 경로 반환
			
			NoticeDTO db_pwd = this.noticeService.getNoticeCont2(notice_no);
			this.noticeService.delNoti(notice_no);//오라클로부터 레코드 삭제
				
				if(db_pwd.getNotice_file() != null) {//기존 첨부파일이 있다면
					File delFile = new File(delFolder+db_pwd.getNotice_file());//삭제할 파일 객체 생성
					delFile.delete();//폴더는 삭제 안되고, 기존 첨부파일만 삭제된다.
				}
				
				
				return "redirect:/spike.com/notice?page=" + page;
				//return null;
		}//noti_del_ok()
		
		// 파일 다운로드 메서드 추가
	    @GetMapping("/downloadFile")
	    public ResponseEntity<byte[]> downloadFile(@RequestParam("fileName") String fileName, HttpServletRequest request) throws IOException {

	        // 업로드 폴더 경로 지정 (이미 정의된 경로로 설정)
	        String uploadFolder = request.getSession().getServletContext().getRealPath("/upload");

	        // 파일 경로 지정 (uploads 폴더 내의 파일을 지정)
	        File file = new File(uploadFolder + fileName);

	        // 파일이 존재하는지 확인
	        if (file.exists()) {
	            // 파일을 바이트 배열로 읽기
	            byte[] fileContent = new byte[(int) file.length()];
	            try (FileInputStream fileInputStream = new FileInputStream(file)) {
	                fileInputStream.read(fileContent);
	            }

	            // 파일 이름을 URL 인코딩하여 처리
	            String encodedFileName = URLEncoder.encode(file.getName(), "UTF-8").replaceAll("\\+", "%20");

	            // 응답 헤더 설정
	            HttpHeaders headers = new HttpHeaders();
	            headers.add("Content-Disposition", "attachment; filename=" + encodedFileName);
	            headers.add("Content-Length", String.valueOf(file.length()));

	            // 응답 객체 반환
	            return new ResponseEntity<>(fileContent, headers, HttpStatus.OK);
	        } else {
	            // 파일이 존재하지 않으면 404 에러 처리
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
	        }
	    }
		
		
	}
	








	

