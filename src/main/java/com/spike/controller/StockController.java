package com.spike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StockController {

    // 1. 주식 시장 페이지 (stock_market.jsp)
    @GetMapping("/stock/market")
    public String stockMarket(Model model) {
        // 주식 시장 데이터를 추가로 가져와야 한다면, model에 담아 JSP로 전달합니다.
        model.addAttribute("pageTitle", "주식 시장");
        return "investment/stock_market"; // stock_market.jsp로 연결
    }

    // 2. 주식 거래 페이지 (stock_trade.jsp)
    @GetMapping("/stock/trade")
    public String stockTrade(
        @RequestParam(name = "stockId", required = false) String stockId, // URL에서 stockId 파라미터를 가져옴
        Model model
    ) {
        // 특정 주식 정보를 가져와야 한다면 여기서 처리합니다.
        if (stockId != null) {
            model.addAttribute("stockId", stockId); // stockId를 JSP에 전달
            model.addAttribute("pageTitle", "주식 거래");
        }
        return "investment/stock_trade"; // stock_trade.jsp로 연결
    }
}
