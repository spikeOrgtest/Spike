package com.spike.controller;

import com.spike.repository.UserRepository;
import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;
import com.spike.service.SecuritiesAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/spike.com/securities-account")
public class SecuritiesAccountController {

	@Autowired
	private SecuritiesAccountService accountService;

	@Autowired
	private UserRepository userRepo;

	@Autowired
	private PasswordEncoder passwordEncoder;


	@GetMapping("/open")
	public String showOpenAccountPage(Principal principal, Model model) {

		if (principal == null) {
			model.addAttribute("errorMessage", "로그인이 필요합니다."); // 오류 메시지 추가
			return "redirect:/spike.com/login"; //로그인 페이지로 리다이렉트
		}

		return "investment/open_securitiesaccount"; // 정상적으로 폼을 포함한 페이지 반환!!!!
	}

	@PostMapping("/open")
	public String createAccount(
			@RequestParam("initialDeposit") long initialDeposit,
			@RequestParam("currency") String currency,
			@RequestParam("accountPassword") String accountPassword,
			Principal principal,
			Model model
			) {
		try {
			//로그인 여부 확인!!!!
			if (principal == null) {
				throw new RuntimeException("로그인이 필요합니다.");
			}

			//로그인된 사용자 가져오기
			String loginId = principal.getName();
			UserDTO user = userRepo.findByLoginId(loginId)
					.orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

			// 계좌 생성
			SecuritiesAccountDTO accountDTO = new SecuritiesAccountDTO();
			accountDTO.setUser(user);
			accountDTO.setCurrency(currency);
			accountDTO.setBalance(initialDeposit);

			// 비밀번호 검증 + 암호화 후 설정!!!!
			accountDTO.validateAndSetAccountPassword(accountPassword, passwordEncoder);

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





	// 증권 계좌 관리 페이지로 이동
	@GetMapping("/manage")
	public String manageSecuritiesAccountPage(Principal principal, Model model, RedirectAttributes redirectAttributes) {
	    try {
	        // 로그인된 사용자 가져오기
	        String loginId = principal.getName();
	        UserDTO user = userRepo.findByLoginId(loginId)
	                .orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

	        // 사용자 계좌 정보 조회
	        SecuritiesAccountDTO account = accountService.getAccountByUser(user);
	        
	        System.out.println(account + "==================");

	        // 계좌가 없으면 계좌 개설 페이지로 리다이렉트 
	        if (account == null) { 
	            redirectAttributes.addFlashAttribute("message", "소유하신 계좌가 없어 생성창으로 이동합니다.");
	            return "redirect:/spike.com/securities-account/open";
	        }

	        // 모델에 계좌 정보 추가
	        model.addAttribute("account", account);

	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "계좌 정보를 불러오는 데 실패했습니다: " + e.getMessage());
	    }
	    return "investment/manage_securitiesaccount"; // JSP 파일의 경로 반환
	}

	
	// 계좌 비밀번호 변경
	@PostMapping("/manage/change-password")
	public String changePassword(
	        @RequestParam("currentPassword") String currentPassword,
	        @RequestParam("newPassword") String newPassword,
	        @RequestParam("accountId") Long accountId,
	        Principal principal,
	        RedirectAttributes redirectAttributes
	) {
	    // 로그인된 사용자 확인
	    String loginId = principal.getName();
	    UserDTO user = userRepo.findByLoginId(loginId)
	            .orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

	    try {
	        //  기존 비밀번호 확인 및 변경 로직을 서비스에서 수행
	        accountService.changeAccountPassword(accountId, currentPassword, newPassword);

	        // 성공 메시지 추가 (Flash Attribute)
	        redirectAttributes.addFlashAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
	    } catch (IllegalArgumentException e) {
	        // 입력 오류 메시지 처리
	        redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
	    } catch (Exception e) {
	        // 기타 예외 처리
	        redirectAttributes.addFlashAttribute("errorMessage", "비밀번호 변경 중 오류가 발생했습니다.");
	    }

	    return "redirect:/spike.com/securities-account/manage";
	}



	@PostMapping("/manage/delete")
	public String deleteAccount(
	        @RequestParam("accountId") Long accountId,
	        @RequestParam("currentPassword") String currentPassword, // 🔥 비밀번호 추가
	        Principal principal,
	        RedirectAttributes redirectAttributes
	) {
	    // 로그인된 사용자 확인
	    String loginId = principal.getName();
	    UserDTO user = userRepo.findByLoginId(loginId)
	            .orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));

	    try {
	        //  서비스 메서드에서 비밀번호 검증 후 삭제 진행
	        accountService.deleteAccount(accountId, currentPassword);
	        redirectAttributes.addFlashAttribute("message", "계좌가 성공적으로 삭제되었습니다.");
	    } catch (IllegalArgumentException e) {
	        // 비밀번호 오류 메시지 처리
	        redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("errorMessage", "계좌 해지 중 오류가 발생했습니다.");
	    }

	    return "redirect:/spike.com/securities-account/manage";
	}






}
