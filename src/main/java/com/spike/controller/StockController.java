package com.spike.controller;

import com.spike.dto.Listing;
import com.spike.dto.SecuritiesAccountDTO;

import com.spike.dto.StockDTO;
import com.spike.dto.UserDTO;
import com.spike.service.ListingService;
import com.spike.service.SecuritiesAccountService;
import com.spike.service.StockHoldingService;
import com.spike.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/spike.com/stock")
public class StockController {

	@Autowired
	private StockService stockService;

	@Autowired
	private SecuritiesAccountService securitiesAccountService;

	@Autowired
	private ListingService listingService;
	
	@Autowired
	private StockHoldingService  stockHoldingService;

	// 주식 시장 페이지
	@GetMapping("/home")
	public String stockMarket(Model model) {
		try {
			// 상위 10개 주식을 가져옵니다.
			List<StockDTO> stockList = stockService.getTopStocks(10);
			model.addAttribute("stockList", stockList);
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Failed to load stock data: " + e.getMessage());
		}
		return "investment/stock_home";
	}

	//  주식 주문 페이지 (판매 폼에 보유 주식 & 판매 중 주식 수량 표시 추가)
    @GetMapping("/{stock_id}/order")
    public String getStockOrderPage(@PathVariable("stock_id") int stockId, Model model, HttpSession session) {
        try {
            System.out.println("🔍 [디버깅] 요청된 주식 ID: " + stockId);

            //  세션에서 UserDTO 가져오기
            UserDTO user = (UserDTO) session.getAttribute("User");
            if (user == null) {
                System.err.println("❌ [세션 오류] 사용자 정보 없음! 로그인 필요!");
                return "redirect:/login"; // 로그인 페이지로 리디렉트
            }

            Long userId = user.getUserId();
            System.out.println("✅ [디버깅] 세션에서 가져온 userId: " + userId);

            //  주식 정보 조회
            Optional<StockDTO> stockOpt = stockService.getStockById(stockId);
            if (stockOpt.isEmpty()) {
                System.err.println("❌ [데이터 오류] 주식 정보 없음! stockId: " + stockId);
                return "redirect:/spike.com/stock/home";
            }
            model.addAttribute("stock", stockOpt.get());
            System.out.println("✅ [디버깅] 주식 정보 조회 성공: " + stockOpt.get().getStockId());

            //  증권 계좌 조회
            Optional<SecuritiesAccountDTO> accountOpt = securitiesAccountService.getAccountByUserId(userId);
            if (accountOpt.isEmpty()) {
                System.err.println("❌ [데이터 오류] 증권 계좌 없음! userId: " + userId);
                return "redirect:/spike.com/securities-account/open";
            }
            SecuritiesAccountDTO securitiesAccount = accountOpt.get();
            model.addAttribute("securitiesAccount", securitiesAccount);
            System.out.println("✅ [디버깅] 증권 계좌 조회 성공: " + securitiesAccount.getAccountId());

            //  해당 주식의 판매 주문(매물) 조회
            List<Listing> saleOrders = listingService.getListingsByStockId(stockId);
            model.addAttribute("saleOrders", saleOrders);
            System.out.println("✅ [디버깅] Sale Orders Size: " + saleOrders.size());

            //  판매자의 보유 주식 수량 조회 (StockHolding)
            int ownedQuantity = stockHoldingService.getStockQuantity(securitiesAccount.getAccountId(), stockId);
            model.addAttribute("ownedQuantity", ownedQuantity);
            System.out.println("✅ [디버깅] 보유 주식 수량: " + ownedQuantity);

            //  현재 판매 중인 주식 수량 조회 (Listing) 
            int listedQuantity = listingService.getTotalListedQuantity(securitiesAccount.getAccountId(), stockId);
            model.addAttribute("listedQuantity", listedQuantity);
            System.out.println("✅ [디버깅] 판매 중인 주식 수량: " + listedQuantity);

        } catch (Exception e) {
            System.err.println("🔥 [예외 발생] " + e.getMessage());
            e.printStackTrace();
           // return "redirect:/spike.com/stock/"+stockId+"/order";
            return "/";
        }

        System.out.println("✅ [디버깅] 모든 검증 통과! 주문 페이지로 이동");
        return "investment/stock_order";
    }



}
