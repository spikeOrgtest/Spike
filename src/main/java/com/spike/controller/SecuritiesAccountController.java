package com.spike.controller;

import com.spike.repository.UserRepository;
import com.spike.dto.AccountDTO;
import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockHolding;
import com.spike.dto.StockTransaction;
import com.spike.dto.UserDTO;
import com.spike.service.AccountService;
import com.spike.service.SecuritiesAccountService;
import com.spike.service.StockHoldingService;
import com.spike.service.StockTransactionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/spike.com/securities-account")
public class SecuritiesAccountController {

	@Autowired
	private SecuritiesAccountService accountService;
	//컨트롤러->서비스->리포지토리 구조가 정석임. userRepo 대신 userService 의존성 주입했어야 함
	@Autowired
	private AccountService accService;

	@Autowired
	private UserRepository userRepo;
	
	@Autowired
    private StockHoldingService stockHoldingService;

    @Autowired
    private StockTransactionService stockTransactionService;

	@Autowired
	private PasswordEncoder passwordEncoder;


	@GetMapping("/open")
	public String showOpenAccountPage(Principal principal, Model model, HttpSession session) {

		if (principal == null) {
			model.addAttribute("errorMessage", "로그인이 필요합니다."); // 오류 메시지 추가
			return "redirect:/spike.com/login"; //로그인 페이지로 리다이렉트
		}

		//세션에서 유저 정보 가져옴(이게 우리가 시큐리티 대신 사용하는 방식), 세션에서 getAttribute로 가져온 객체는 Object 타입이므로 UserDTO로 다운캐스팅
		UserDTO user = (UserDTO)session.getAttribute("User");
		//UserDTO를 매개변수로 모든 계좌 목록을 가져오는 메서드, 계좌 없으면 빈 리스트 반환(null 아님)
		List<AccountDTO> accList = this.accService.getActiveAccountsForUser(user);
		//모델에 계좌 목록을 담아서 뷰페이지로 전달할것
		model.addAttribute("accList", accList);
		
		return "investment/open_securitiesaccount"; // 정상적으로 폼을 포함한 페이지 반환!!!!
	}

	@PostMapping("/open")
	public String createAccount(
			@RequestParam("initialDeposit") long initialDeposit,
			@RequestParam("currency") String currency,
			@RequestParam("accountPassword") String accountPassword,
			Principal principal,
			Model model,
			String selectedAccountNumber //폼에서 전달된 출금계좌번호
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
			
			System.out.println("\n========================\n" + selectedAccountNumber);

			//출금 계좌에서 금액 차감 (계좌 타입이 달라서 transfer 불가능, 원래 이런 식으로 하면 안 됨)
			AccountDTO fromAccount = this.accService.findByAccount(selectedAccountNumber);
			fromAccount.setBalance(fromAccount.getBalance() - initialDeposit);
			this.accService.saveAccount(fromAccount);
			
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
	
	// 내 자산 확인하기 페이지
    @GetMapping("/my-assets")
    public String showMyAssets(Model model, Principal principal) {
        // 로그인 여부 확인
        if (principal == null) {
            model.addAttribute("errorMessage", "로그인이 필요합니다.");
            return "redirect:/spike.com/login";
        }
        
        // 로그인 사용자 정보 조회
        String loginId = principal.getName();
        UserDTO user = userRepo.findByLoginId(loginId)
                .orElseThrow(() -> new RuntimeException("사용자 정보를 찾을 수 없습니다."));
        
        // 해당 사용자 증권 계좌 조회
        SecuritiesAccountDTO account = accountService.getAccountByUser(user);
        if (account == null) {
            return "redirect:/spike.com/securities-account/open";
        }
        
        // 예수금 조회 (SecuritiesAccountDTO.balance 활용)
        int availableBalance = (int) account.getBalance();
        model.addAttribute("availableBalance", availableBalance);
        
        // 보유 주식 내역 조회
        List<StockHolding> stockHoldings = stockHoldingService.getHoldingsByAccountId(account.getAccountId());
        model.addAttribute("stockHoldings", stockHoldings);
        
        // 총 보유 주식 금액 계산 (각 보유수량 × 주식 현재가 합)
        int totalStockValue = stockHoldingService.calculateTotalStockValue(account.getAccountId());
        model.addAttribute("totalStockValue", totalStockValue);
        
        // 거래 내역 조회 (해당 증권 계좌 관련 거래 내역)
        List<StockTransaction> transactionList = stockTransactionService.getTransactionsByAccountId(account.getAccountId());
        model.addAttribute("transactionList", transactionList);
        
        // 현재 증권 계좌 ID (거래 내역에서 구매/판매 구분용)
        model.addAttribute("currentAccountId", account.getAccountId());
        
        return "investment/my_assets"; // 뷰 이름 (예: /WEB-INF/views/investment/my_assets.jsp)
    }

    //내 계좌로 출금
    @GetMapping("/withdraw")
    public ModelAndView withdraw(HttpSession session) {
    	
    	ModelAndView mv = new ModelAndView("investment/withdraw");
    	UserDTO user = (UserDTO)session.getAttribute("User");
        SecuritiesAccountDTO securitiesAccount = accountService.getAccountByUser(user);
    	List<AccountDTO> accList = this.accService.getActiveAccountsForUser(user);
    	
    	mv.addObject("accList", accList);
    	mv.addObject("securitiesAccount", securitiesAccount);
    	
    	return mv;
    }




}
