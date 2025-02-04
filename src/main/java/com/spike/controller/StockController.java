package com.spike.controller;

import com.spike.dto.Stock;
import com.spike.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/spike.com/stock")
public class StockController {

	@Autowired
	private StockService stockService;

	// 주식 시장 페이지
	@GetMapping("/home")
	public String stockMarket(Model model) {
		try {
			// 상위 10개 주식을 가져옵니다.
			List<Stock> stockList = stockService.getTopStocks(10);
			model.addAttribute("stockList", stockList);
		} catch (Exception e) {
			model.addAttribute("errorMessage", "Failed to load stock data: " + e.getMessage());
		}
		return "investment/stock_market";
	}

	// 주식 주문 창
	@GetMapping("/{stock_code}/order")
	public String getStockOrderPage(@PathVariable("stock_code") String stockCode, Model model) {
		try {
			// stock_code로 주식 데이터를 가져옴
			Stock stock = stockService.getStockByCode(stockCode);
			model.addAttribute("stock", stock); // 주식 정보를 모델에 추가
		} catch (Exception e) {
			model.addAttribute("errorMessage", "주식 정보를 불러오는 데 실패했습니다: " + e.getMessage());
		}
		return "investment/stock_order"; // JSP 파일 이름
	}

	// 증권 계좌 개설 페이지로 이동
		@GetMapping("/spike/securities-account/open")
		public String openSecuritiesAccountPage() {
			return "investment/open_securitiesaccount"; // JSP 파일의 경로 반환
		}

		// 증권 계좌 관리 페이지로 이동
		@GetMapping("/spike/securities-account/manage")
		public String manageSecuritiesAccountPage() {
			return "investment/manage_securitiesaccount"; // JSP 파일의 경로 반환
		}
}
