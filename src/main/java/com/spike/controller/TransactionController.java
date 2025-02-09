package com.spike.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spike.dto.AccountDTO;
import com.spike.dto.TransferDTO;
import com.spike.dto.TransferHistoryDTO;
import com.spike.dto.UserDTO;
import com.spike.service.TransactionService;

@Controller
@RequestMapping("/spike.com")
public class TransactionController {

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private TransactionService transService;

	// 이체 페이지
	@GetMapping("transfer")
	public ModelAndView transferPage(HttpSession session, RedirectAttributes redirectAttributes) {

		ModelAndView mv = new ModelAndView();
		UserDTO user = (UserDTO) session.getAttribute("User");
		if (user != null) { // 로그인 된 상태 확인 후 계좌목록, 거래기록 담아서 뷰페이지 반환
			List<AccountDTO> accList = this.transService.getAccountList(user);
			List<TransferHistoryDTO> histories = this.transService.getRecentTransfers(user.getUserId());

			mv.addObject("accountList", accList);
			mv.addObject("histories", histories);
		}else { //로그인 하지 않고 사용시 예외처리(기존 코드 재활용)
			mv.addObject("errorMessage", "로그인이 필요한 서비스입니다.");
			mv.addObject("needRedirection", "true");
		}
		mv.setViewName("transfer/transfer");

		
		return mv;
	}

	@PostMapping("transfer")
	public String transfer_ok(Long fromAccountId, String toAccount, long amount, String memo, String accountPassword,
			HttpSession session, RedirectAttributes redirectAttributes) {

		// 잘못된 계좌번호 입력시 서비스에서 에러 던짐 -> 컨트롤러에서 catch 필요
		try {
			// 출금계좌, 받는 계좌 주인 가져와서 변수에 저장
			AccountDTO fromAcc = this.transService.getAccount(fromAccountId);
			UserDTO owner = this.transService.getOwner(toAccount);

			String password = fromAcc.getAccountPassword();
			String ownerName = owner.getName();
			String ownerStatus = owner.getStatus();
			// 계좌 주인 이름, 상태 구하는 코드 통합 -> 아래 코드는 삭제예정
			// 받는 사람의 이름 조회
			// 받는 사람 상태 조회(shield 때문에 필요)
			// String password =
			// this.transService.getAccount(fromAccountId).getAccount_password();
			// String toAccOwner = this.transService.getOwnerName(toAccount);
			// String status = this.transService.getOwnerStatus(toAccount);

			// 비밀번호 서버에서 검증 후 에러처리, 틀린 계좌번호와 같은 방식
			if (!passwordEncoder.matches(accountPassword, password)) {
				redirectAttributes.addFlashAttribute("errorMessage", "계좌 비밀번호가 일치하지 않습니다. 비밀번호를 확인해 주세요!");
				return "redirect:/spike.com/transfer";
			}

			// 데이터 전송 객체(DTO)에 폼에서 받아온 정보 저장 후 세션에 DTO 객체 저장
			TransferDTO tData = new TransferDTO(fromAccountId, toAccount, amount, memo, accountPassword, ownerName,
					ownerStatus);
			session.setAttribute("Data", tData);

			// 뒤로가기, 새로고침시 폼 복구됨(양식 다시 제출) -> Post-Redirect-Get패턴으로 post요청 중복 방지
			return "redirect:/spike.com/transfer_ok";

		} catch (Exception e) { // .orElseThrow(() -> new IllegalArgumentException("계좌를 찾을 수 없습니다.")) 이 에러가 던져짐

			//System.out.println(e.getMessage());
			// model에 담아 뷰페이지를 렌더링하면 제대로 동작이 안됨 -> redirectAttribute에 담아 리다이렉션해서 해결
			redirectAttributes.addFlashAttribute("errorMessage", "존재하지 않는 계좌입니다. 입금계좌를 확인해 주세요!");

			return "redirect:/spike.com/transfer";
			/*
			 * PrintWriter out; //컨트롤러에서 직접 <script>를 출력하는 방법(수업소스), 정상 동작하지만 날코딩 느낌 try {
			 * out = response.getWriter(); out.println("<script>");
			 * out.println("alert('존재하지 않는 계좌입니다.\\n 입금계좌를 확인해 주세요!');");
			 * out.println("history.back();"); out.println("</script>"); return null; }
			 * catch (IOException e1) { e1.printStackTrace(); return null; }
			 */

		}
	}

	// PRG패턴의 Get부분, 히스토리에 post 요청이 남지 않아서 뒤로가기 눌러도 @Postmapping("transfer_ok") 요청이
	// 발생하지 않는 원리
	@GetMapping("transfer_ok")
	public String getTransfer_ok() {
		return "transfer/transfer_ok";
	}

	// 송금 최종 처리
	@PostMapping("transfer_ok")
	public String transfer(HttpSession session) {

		TransferDTO tData = (TransferDTO) session.getAttribute("Data");

		this.transService.transfer(tData);

		

		return "redirect:/spike.com/transfer_success";
	}

	// 송금 취소시 Data 제거 후 송금 페이지로 이동
	@GetMapping("transfer_cancel")
	public String transfer_cancel(HttpSession session) {

		session.removeAttribute("Data");
		return "redirect:/spike.com/transfer";
	}
	
	@GetMapping("transfer_success")
	public String transfer_success(HttpSession session, Model model) {
		/* 이체 완료 페이지에 출력할 데이터를 모델에 담아 전달, 세션 데이터는 삭제 -> 뷰페이지에서 ajax 요청을 통해 제거하는 방식으로 변경
		model.addAttribute("Data", session.getAttribute("Data"));
		session.removeAttribute("Data");
		*/
		return "transfer/transfer_success";
	}
	
	//이체 완료 후 세션 데이터 삭제
	@PostMapping("transfer_clear")
	public String transfer_clear(HttpSession session) {
		System.out.println("데이터 삭제 요청");
		session.removeAttribute("Data");
		return "redirect:/spike.com";
	}
}
