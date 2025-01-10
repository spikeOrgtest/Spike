package com.spike.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.spikeDTO;
import com.spike.service.spikeSerivce;

import spikepwd.PwdChange;

@Controller
public class spikeController {

	@Autowired 
	private spikeSerivce spikeService;

	// 메인 페이지
	@GetMapping("/")
	public String index() {
		return "index";
	}

	// 로그인 폼
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView s = new ModelAndView();
		s.setViewName("/login");
		return s;
	}

	// 회원가입 폼
	@GetMapping("/signup")
	public ModelAndView signup() {

		String[] phone = {"010","011","019"};
		String[] email = {"gmail.com","naver.com","daum.net","nate.com","직접입력"};

		ModelAndView ss = new ModelAndView("/signup");

		ss.addObject("phone", phone);
		ss.addObject("email", email);
		return ss;
	}

	//아이디 중복 검색
	@PostMapping("/signup_idcheck")
	public ModelAndView signup_idcheck(String id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		spikeDTO ds = this.spikeService.idCheck(id);

		int re = -1;

		if(ds != null) {
			re = 1;
		}
		out.println(re);
		return null;
	}

	// 회원 저장
	@PostMapping("/signup_ok")
	public ModelAndView signup_ok(spikeDTO s, HttpServletRequest request, BindingResult result) throws IOException {

		// 이메일 도메인 처리
		String email = s.getEmail_id() + "@" + s.getEmail_domain(); // 이메일 ID와 도메인을 합침
		if (email != null && !email.isEmpty()) {
			String[] emailParts = email.split("@");
			if (emailParts.length == 2) {
				s.setEmail_id(emailParts[0]);
				s.setEmail_domain(emailParts[1]); // email_domain 필드에 도메인 부분을 설정
			}
		}

		// 전화번호 필수값 체크
		if (s.getPhone01() == null || s.getPhone02() == null || s.getPhone03() == null ||
				s.getPhone01().isEmpty() || s.getPhone02().isEmpty() || s.getPhone03().isEmpty()) {
			ModelAndView mv = new ModelAndView("/signup"); // 전화번호가 비었을 경우 다시 회원가입 페이지로 리다이렉트
			mv.addObject("error", "전화번호는 필수 항목입니다.");
			return mv;
		}

		// 전화번호 합치기 (phone01 + phone02 + phone03)
		String phone = s.getPhone01() + "-" + s.getPhone02() + "-" + s.getPhone03();
		s.setPhone(phone); // spikeDTO에 합친 전화번호 저장

		MultipartFile file = s.getProfileImage(); // 업로드된 프로필 이미지

		if (file != null && !file.isEmpty()) {
			System.out.println("Upload File Name: "+ file.getOriginalFilename());//업로드 된 원본파일명
			System.out.println("Upload File Size: "+ file.getSize());//업로드 파일크기
			// 파일을 저장할 디렉토리 경로
			String uploadFolder = request.getSession().getServletContext().getRealPath("/upload");

			// 날짜별로 폴더 생성 (년/월/일)
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int date = cal.get(Calendar.DATE);

			String homedir = uploadFolder + "/" + year + "-" + month + "-" + date;
			File path01 = new File(homedir);

			if (!path01.exists()) {
				path01.mkdirs(); // 경로가 없으면 디렉토리 생성
			}

			// 파일 이름을 랜덤하게 생성하여 중복 방지
			Random r = new Random();
			int random = r.nextInt(1000000000);
			String fileName = file.getOriginalFilename();
			int index = fileName.lastIndexOf(".");
			String fileExtension = fileName.substring(index + 1);
			String refileName = "profile" + year + month + date + random + "." + fileExtension;

			// DB에 저장할 파일 경로 (파일 경로만 저장)
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			s.setProfile_image_uri(fileDBName); // profile_image_uri에 경로 저장

			// 파일 저장
			File saveFile = new File(homedir + "/" + refileName);
			file.transferTo(saveFile); // 실제 파일을 저장
		} else {
			// 파일이 없으면 빈 경로로 처리
			s.setProfile_image_uri(""); 
		}

		s.setPassword(PwdChange.getPassWordToXEMD5String(s.getPassword()));

		// DB에 사용자 정보 저장
		this.spikeService.insertMember(s);

		// 로그인 페이지로 리다이렉트
		return new ModelAndView("redirect:/login");
	}

	// 로그인
	@PostMapping("/login_ok")
	public ModelAndView login_ok(String login_id, String password, HttpServletResponse response,
			HttpSession session) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		spikeDTO s = this.spikeService.loginCheck(login_id);

		if( s == null) {
			out.println("<script>");
			out.println("alert('존재하지않는 아이디입니다.');");
			out.println("history.back();");
			out.println("</script>");
		} else {
			if(!s.getPassword().equals(PwdChange.getPassWordToXEMD5String(password))) {
				out.println("<script>");
				out.println("alert('비밀번호가 틀립니다.');");
				out.println("history.back();");
				out.println("</script>");
			} else {
				session.setAttribute("id", login_id);

				ModelAndView loginS = new ModelAndView();
				loginS.setViewName("redirect:/");
				return loginS;
			}
		}
		return new ModelAndView("redirect:/login?error=true");
	}

	// 아이디 찾기 폼
	@GetMapping("findId")
	public ModelAndView findId() {
		String[] phone = {"010","011","019"};
		ModelAndView fs = new ModelAndView("/findId");
		fs.addObject("phone", phone);
		return fs;
	}

	// 아이디 찾기
	@PostMapping("findId_ok")
	public ModelAndView findId_ok(String name, String phone, HttpServletResponse response, spikeDTO s) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		s.setName(name);
		phone = s.getPhone01() + "-" + s.getPhone02() + "-" + s.getPhone03();
		s.setPhone(phone);

		spikeDTO is = this.spikeService.findId(s);

		if(is == null) {
			out.println("<script>");
			out.println("alert('회원으로 검색되지 않습니다!\\n 올바른 회원정보를 입력하세요!');");
			out.println("history.go();");
			out.println("</script>");
		} else {
			String find_id = is.getLogin_id();
			String find_name = is.getName();

			ModelAndView fi = new ModelAndView("findId_ok");

			fi.addObject("find_id", find_id);
			fi.addObject("find_name", find_name);

			return fi;
		}
		return null;
	}

	// 비밀번호 찾기 폼
	@GetMapping("findPwd")
	public String findPwd() {
		return "findPwd";
	}

	// 비밀번호 찾기
	@PostMapping("findPwd_ok")
	public ModelAndView findPwd_ok(String id, String name, HttpServletResponse response, spikeDTO s) throws Exception {
	    response.setContentType("text/html;charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    s.setLogin_id(id);
	    s.setName(name);
	    spikeDTO ps = this.spikeService.findPwd(s);

	    if (ps == null) {
	        out.println("<script>");
	        out.println("alert('회원으로 검색되지 않습니다!\\n 올바른 회원정보를 입력하세요!');");
	        out.println("history.go();");
	        out.println("</script>");
	    } else {
	        // 찾은 아이디와 이름을 수정 페이지로 전달
	        ModelAndView fp = new ModelAndView("findPwd_change");
	        fp.addObject("find_id", ps.getLogin_id());
	        fp.addObject("find_name", ps.getName());

	        return fp;
	    }
	    return new ModelAndView("redirect:/findPwd_change");
	}


	// 비밀번호 변경
	@PostMapping("findPwd_change_ok")
	public String findPwd_change_ok(String login_id, String name, String newPassword, String confirmPassword, HttpServletResponse response) throws Exception {
	    // 비밀번호와 확인 비밀번호가 일치하는지 확인
	    if (!newPassword.equals(confirmPassword)) {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('비밀번호와 비밀번호 확인이 일치하지 않습니다!');");
	        out.println("history.go(-1);");
	        out.println("</script>");
	        return null;
	    }

	    // 현재 사용자 정보 조회 (로그인 ID와 이름을 통해 조회)
	    spikeDTO s = new spikeDTO();
	    s.setLogin_id(login_id);
	    s.setName(name);
	    
	    // 현재 사용자의 기존 비밀번호를 DB에서 조회
	    spikeDTO existingUser = this.spikeService.findPwd(s);  // 비밀번호 조회 서비스 호출

	    // 만약 사용자가 존재하지 않거나 기존 비밀번호가 없다면 처리
	    if (existingUser == null) {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('회원정보를 찾을 수 없습니다!');");
	        out.println("history.go(-1);");
	        out.println("</script>");
	        return null;
	    }

	    // 기존 비밀번호와 새 비밀번호가 동일한지 확인
	    String existingPassword = existingUser.getPassword();  // DB에서 가져온 기존 비밀번호
	    String encryptedNewPassword = PwdChange.getPassWordToXEMD5String(newPassword); // 새 비밀번호를 암호화

	    if (existingPassword.equals(encryptedNewPassword)) {
	        // 새 비밀번호가 기존 비밀번호와 동일하면 실패 처리
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('기존 비밀번호와 새 비밀번호가 동일합니다!');");
	        out.println("window.location.href = '/findPwd';");
	        out.println("</script>");
	        return null;
	    }

	    // 새 비밀번호를 암호화한 후 비밀번호 변경
	    s.setPassword(encryptedNewPassword); // 새 비밀번호 설정
	    spikeDTO updatedUser = this.spikeService.changePwd(s); // 비밀번호 수정 서비스 호출

	    if (updatedUser != null) {
	        // 수정이 성공하면 성공 메시지 및 리다이렉트
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('비밀번호 변경에 성공했습니다!');");
	        out.println("window.close();");
	        out.println("</script>");
	        return null;  // 리다이렉트 후 새로운 페이지 로드
	    } else {
	        // 수정 실패 시 처리
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>");
	        out.println("alert('비밀번호 변경에 실패했습니다!');");
	        out.println("history.go(-1);");
	        out.println("</script>");
	        return null;  // 실패 시 다시 돌아가도록 처리
	    }
	}


}







