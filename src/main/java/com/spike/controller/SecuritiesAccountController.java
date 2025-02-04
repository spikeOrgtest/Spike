package com.spike.controller;

import com.spike.repository.UserRepository;
import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;
import com.spike.service.SecuritiesAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/api/securities-account")
public class SecuritiesAccountController {

	@Autowired
	private SecuritiesAccountService accountService;

	@Autowired
	private UserRepository userRepo;

	@PostMapping("/securitiesaccount/open")
	public String createAccount(
			@RequestParam("initialDeposit") Double initialDeposit,
			@RequestParam("currency") String currency,
			@RequestParam("accountPassword") String accountPassword, // 비밀번호 입력 추가
			Principal principal,
			Model model
			) {
		try {
			// 로그인된 사용자 가져오기
			String loginId = principal.getName();
			UserDTO user = userRepo.findByLoginId(loginId)
					.orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

			// 계좌 생성
			SecuritiesAccountDTO accountDTO = new SecuritiesAccountDTO();
			accountDTO.setUser(user);
			accountDTO.setCurrency(currency);
			accountDTO.setBalance(initialDeposit);
			accountDTO.setAccountPassword(accountPassword); // 비밀번호 설정

			SecuritiesAccountDTO createdAccount = accountService.createAccount(accountDTO, user);

			// 모델에 생성된 계좌 추가
			model.addAttribute("account", createdAccount);
			return "investment/account_confirmation"; // 계좌 생성 확인 페이지로 이동
		} catch (IllegalStateException e) {
			// 예외 발생 시 오류 메시지를 모델에 추가
			model.addAttribute("errorMessage", e.getMessage());
			return "investment/account_error"; // 에러 페이지로 이동
		}
	}

	// 사용자 계좌 조회
	@GetMapping("/user/{userId}/account")
	@ResponseBody
	public List<SecuritiesAccountDTO> getAccountsByUserId(@PathVariable Long userId) {
		// UserDTO 객체 생성 및 설정
		UserDTO user = new UserDTO();
		user.setUserId(userId);
		return accountService.getAccountsByUser(user);
	}

	//계좌 관리
	@PostMapping("/change-password")
	public String changePassword(
			@RequestParam("newPassword") String newPassword,
			@RequestParam("accountId") Long accountId,
			Principal principal,
			RedirectAttributes redirectAttributes
			) {
		// 로그인된 사용자 확인
		String loginId = principal.getName();
		UserDTO user = userRepo.findByLoginId(loginId)
				.orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

		// 비밀번호 변경
		accountService.changeAccountPassword(accountId, newPassword);

		// 성공 메시지 추가
		redirectAttributes.addFlashAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
		return "redirect:/api/securities-account/user/accounts";
	}

	//계좌 삭제
	@PostMapping("/delete")
	public String deleteAccount(
			@RequestParam("accountId") Long accountId,
			Principal principal,
			RedirectAttributes redirectAttributes
			) {
		// 로그인된 사용자 확인
		String loginId = principal.getName();
		UserDTO user = userRepo.findByLoginId(loginId)
				.orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

		// 계좌 삭제
		accountService.deleteAccount(accountId);

		// 성공 메시지 추가
		redirectAttributes.addFlashAttribute("message", "계좌가 성공적으로 삭제되었습니다.");
		return "redirect:/api/securities-account/user/accounts";
	}
	
	// 증권 계좌 관리 페이지로 이동
	@GetMapping("/spike/securities-account/manage")
	public String manageSecuritiesAccountPage(Principal principal, Model model) {
	    try {
	        // 로그인된 사용자 가져오기
	        String loginId = principal.getName();
	        UserDTO user = userRepo.findByLoginId(loginId)
	                .orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

	        // 사용자 계좌 정보 조회
	        List<SecuritiesAccountDTO> accounts = accountService.getAccountsByUser(user);

	        // 모델에 계좌 정보 추가
	        model.addAttribute("accounts", accounts);
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "계좌 정보를 불러오는 데 실패했습니다: " + e.getMessage());
	    }
	    return "investment/manage_securitiesaccount"; // JSP 파일의 경로 반환
	}

	

}
