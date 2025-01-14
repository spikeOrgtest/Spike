package com.spike.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spike.model.Stock;

@Controller
public class StockController {

    // 1. 주식 시장 페이지 (stock_market.jsp)
    @GetMapping("spike/stock/home")
    public String stockMarket(Model model) {
        // 주식 시장 데이터를 추가로 가져와야 한다면, model에 담아 JSP로 전달합니다.
        model.addAttribute("pageTitle", "주식 시장");
        return "investment/stock_market"; // stock_market.jsp로 연결
    }

    // 2. 주식 주문 페이지 (stock_order.jsp)
    @GetMapping("spike/stock/order")
    public String stockTrade(
        @RequestParam(name = "stockId", required = false) String stockId, // URL에서 stockId 파라미터를 가져옴
        Model model
    ) {
        // 특정 주식 정보를 가져와야 한다면 여기서 처리합니다.
        if (stockId != null) {
            model.addAttribute("stockId", stockId); // stockId를 JSP에 전달
            model.addAttribute("pageTitle", "주식 거래");
        }
        return "investment/stock_order"; // stock_trade.jsp로 연결
    }
    
    //3.주식 계좌 자산 페이지(stock_account_asset.jsp)
    @GetMapping("spike/stock/account/assets")
    public String accountAssets(Model model) {
        // 예시 데이터 설정 (실제 DB 연동 시 교체 필요)
        model.addAttribute("pageTitle", "자산 현황");
        model.addAttribute("accountNumber", "123-456-789");
        model.addAttribute("totalAssets", 50000000); // 총 자산
        model.addAttribute("availableBalance", 10000000); // 보유 현금
        model.addAttribute("investedAmount", 40000000); // 투자 중인 금액
        model.addAttribute("profit", 2000000); // 수익

        // 주식 데이터 리스트 (예시)
        List<Stock> stockList = List.of(
            new Stock("삼성전자", 10, 70000, 700000, 10.5),
            new Stock("LG화학", 5, 800000, 4000000, - 8.2)
        );
        model.addAttribute("stockList", stockList);

        return "investment/stock_account_assets"; // JSP 파일 연결
    }

}
