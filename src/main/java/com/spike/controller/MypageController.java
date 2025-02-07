package com.spike.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spike.dto.AccountDTO;
import com.spike.dto.TransactionDTO;
import com.spike.dto.TransferHistoryDTO;
import com.spike.dto.UserDTO;
import com.spike.service.AccountService;
import com.spike.service.TransactionService;
import com.spike.service.UserSerivce;

@Controller
@RequestMapping("/spike.com/mypage")
public class MypageController {

	@Autowired
	private UserSerivce userService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private TransactionService transService;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	// 마이페이지 메인
	@GetMapping("/main")
	public ModelAndView main(HttpSession session) {
		UserDTO user = (UserDTO) session.getAttribute("User");

		String name = user.getName();
		String e_mail = user.getEmailId();
		String e_mail2 = user.getEmailDomain();
		LocalDate Registrationdate = user.getRegistrationDate();
		String phone = user.getPhone();
		String roadaddress = user.getRoadAddress();
		String detailaddress = user.getDetailAddress();
		LocalDate birthdate = user.getBirthDate();

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

	// 마이페이지 메인 프로필 수정
	@PostMapping("/profileEdit")
	public ModelAndView profileEdit(UserDTO s, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 세션에 저장된 객체 저장
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");

		String loginId = sessionUser.getLoginId();
		s.setLoginId(loginId);

		// 이메일 도메인 처리
		String email = s.getEmailId() + "@" + s.getEmailDomain(); // 이메일 ID와 도메인을 합침
		if (email != null && !email.isEmpty()) {
			String[] emailParts = email.split("@");
			if (emailParts.length == 2) {
				s.setEmailId(emailParts[0]);
				s.setEmailDomain(emailParts[1]); // EmailDomain 필드에 도메인 부분을 설정
			}
		}

		// 기존 비밀번호와 새 비밀번호가 동일한지 확인
		String existingPassword = sessionUser.getPassword(); // DB에서 가져온 기존 비밀번호
		String encryptedNewPassword = passwordEncoder.encode(s.getPassword()); // 새 비밀번호를 암호화
		String currentPassword = request.getParameter("currentPassword");
		
		if (!passwordEncoder.matches(currentPassword, existingPassword)) {
			out.println("<script>");
			out.println("alert('현재 비밀번호가 일치하지 않습니다!');");
			out.println("window.location.href = '/spike.com/mypage/main';");
			out.println("</script>");
			return null;
		}

		if (passwordEncoder.matches(s.getPassword(), existingPassword)) {
			out.println("<script>");
			out.println("alert('기존 비밀번호와 새 비밀번호가 동일합니다!');");
			out.println("window.location.href = '/spike.com/mypage/main';");
			out.println("</script>");
			return null;
		}

		s.setPassword(encryptedNewPassword);

		this.userService.profileEdit(s);

		// 세션에 저장된 객체에 바뀐 이름 저장(header.jsp 이름 변경 반영을 위함)
		sessionUser.setName(s.getName());
		session.setAttribute("User", sessionUser);

		out.println("<script>");
		out.println("alert('회원정보가 수정되었습니다!');");
		out.println("window.location.href = '/spike.com/';"); // 실패 시 마이페이지 수정 페이지로 리다이렉트
		out.println("</script>");

		return null;
	}

	// 마이페이지 회원정보 수정 폼
	@GetMapping("/mypageEdit")
	public ModelAndView edit(HttpSession session) {

		String[] phone = { "010", "011", "019" };
		String[] email = { "gmail.com", "naver.com", "daum.net", "nate.com", "직접입력" };
		ModelAndView s = new ModelAndView();
		s.addObject("phone", phone);
		s.addObject("email", email);
		s.setViewName("/mypage/mypageEdit");

		return s;
	}

	// 마이페이지 회원정보 수정 폼
	@PostMapping("/mypageEdit")
	public ModelAndView mypageEdit(UserDTO s, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		UserDTO user = (UserDTO) session.getAttribute("User");

		String loginId = user.getLoginId();
		s.setLoginId(loginId);

		// 이메일 도메인 처리
		String email = s.getEmailId() + "@" + s.getEmailDomain(); // 이메일 ID와 도메인을 합침
		if (email != null && !email.isEmpty()) {
			String[] emailParts = email.split("@");
			if (emailParts.length == 2) {
				s.setEmailId(emailParts[0]);
				s.setEmailDomain(emailParts[1]); // EmailDomain 필드에 도메인 부분을 설정
			}
		}

		// 전화번호 합치기 (phone01 + phone02 + phone03)
		String phone = s.getPhone01() + "-" + s.getPhone02() + "-" + s.getPhone03();
		s.setPhone(phone); // spikeDTO에 합친 전화번호 저장

		// 기존 비밀번호와 새 비밀번호가 동일한지 확인
		String existingPassword = user.getPassword(); // DB에서 가져온 기존 비밀번호
		String encryptedNewPassword = passwordEncoder.encode(s.getPassword()); // 새 비밀번호를 암호화
		String currentPassword = request.getParameter("currentPassword");

		if (!passwordEncoder.matches(currentPassword, existingPassword)) {
			out.println("<script>");
			out.println("alert('현재 비밀번호가 일치하지 않습니다!');");
			out.println("window.location.href = '/spike.com/mypage/mypageEdit';");
			out.println("</script>");
			return null;
		}

		if (passwordEncoder.matches(s.getPassword(), existingPassword)) {
			out.println("<script>");
			out.println("alert('기존 비밀번호와 새 비밀번호가 동일합니다!');");
			out.println("window.location.href = '/spike.com/mypage/mypageEdit';");
			out.println("</script>");
			return null;
		}

		s.setPassword(encryptedNewPassword); // 비밀번호 변경

		this.userService.mypageEdit(s);

		user.setName(s.getName());
		session.setAttribute("User", user);

		out.println("<script>");
		out.println("alert('회원정보가 수정되었습니다!');");
		out.println("window.location.href = '/spike.com/mypage/mypageEdit';");
		out.println("</script>");

		return null;
	}

	// 마이페이지 회원 탈퇴
	@PostMapping("/main")
	public ModelAndView secession(@RequestParam("loginId") String loginId, Long userId, String account_number,
			HttpSession session, Model model, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
		userId = sessionUser.getUserId();
		List<String> list = userService.findbyaccountnumber(userId);

		if (list.size() == 0) {
			this.userService.usersecession(loginId);
			session.invalidate(); // 세션 만료
			model.addAttribute("message", "Spike를 이용해주셔서 감사합니다.");
			return new ModelAndView("/mypage/secessionComplete");

		} else {

			out.println("<script>");
			out.println("alert('계좌 정보가 존재합니다! 관리자에게 문의 후 다시 요청바랍니다.');");
			out.println("window.location.href = '/spike.com/mypage/main';");
			out.println("</script>");
			return null;

		}

	}

	// 회원 탈퇴 완료
	@GetMapping("/secessionComplete")
	public ModelAndView secessionComplete() {
		return new ModelAndView("/mypage/secessionComplete");
	}

	// 계좌 조회 폼
	@GetMapping("inquiry")
	public ModelAndView inquiry(HttpSession session, Long userId) {
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
		userId = sessionUser.getUserId();

		
		List<AccountDTO> list = userService.findbyinquriy(userId);

		// 각 계좌별 송금 + 입금 내역을 저장할 Map 생성
        Map<Long, List<TransferHistoryDTO>> transactionMap = new HashMap<>();
        for (AccountDTO account : list) {
            List<TransferHistoryDTO> histories = this.transService.getTransferHistoryByAccountId(account.getAccountId());
            transactionMap.put(account.getAccountId(), histories);
        }

		ModelAndView account = new ModelAndView("mypage/mypageinquiry");
		
		account.addObject("transactionMap", transactionMap); // 계좌별 거래 내역 전달
		account.addObject("list", list);

		return account;

	}

	// 계좌 조회 일일 한도 설정
	@PostMapping("inquiryLimit")
	public String inquiryLimit(Long one_limit, Long day_limit, String account_number) {

		if (one_limit != null) {
			this.accountService.Oneupdateaccount(one_limit, account_number);
		}

		if (day_limit != null) {
			this.accountService.Dayupdateaccount(day_limit, account_number);
		}

		return "redirect:/spike.com/mypage/inquiry";
	}

	// 계좌 조회 비밀번호 변경
	@PostMapping("inquiryPassword")
	public String inquiryPassword(AccountDTO a, String account_number, HttpServletResponse response,
			HttpServletRequest request) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		AccountDTO ac = this.accountService.findByAccount(account_number);

		// 기존 비밀번호와 새 비밀번호가 동일한지 확인
		String existingPassword = ac.getAccountPassword(); // DB에서 가져온 기존 비밀번호
		String encryptedNewPassword = passwordEncoder.encode(a.getAccountPassword()); // 새 비밀번호를 암호화
		String currentPassword = request.getParameter("currentPassword");

		if (!passwordEncoder.matches(currentPassword, existingPassword)) {
			// passwordEncoder.matches(평문(jsp 받아온 암호화 되기전 데이터) 비밀번호, DB에 저장되있는 암호화 비밀번호) 평문
			// 비밀번호를 DB에 저장되있는
			// 기존 비밀번호와 동일한 방식으로 암호화 처리를 해 데이터 비교
			out.println("<script>");
			out.println("alert('현재 비밀번호가 일치하지 않습니다!');");
			out.println("window.location.href = '/spike.com/mypage/inquiry';");
			out.println("</script>");
			return null;
		}

		if (passwordEncoder.matches(a.getAccountPassword(), existingPassword)) {
			out.println("<script>");
			out.println("alert('기존 비밀번호와 새 비밀번호가 동일합니다!');");
			out.println("window.location.href = '/spike.com/mypage/inquiry';");
			out.println("</script>");
			return null;
		}

		a.setAccountPassword(encryptedNewPassword); // 비밀번호 변경

		this.accountService.Passwordupdateaccount(a);

		out.println("<script>");
		out.println("alert('비밀번호가 수정되었습니다!');");
		out.println("window.location.href = '/spike.com/mypage/inquiry';");
		out.println("</script>");

		return null;
	}

	@GetMapping("property")
	public ModelAndView property() {

		return new ModelAndView("/mypage/mypageproperty");
	}

	// 대출현황 폼 (만드는 중 2/6)
	@GetMapping("/loan")
	public ModelAndView loan(HttpSession session, Long userId) {
		UserDTO sessionUser = (UserDTO) session.getAttribute("User");
		userId = sessionUser.getUserId();
		
		return new ModelAndView("/mypage/mypageLoan");
	}

}
