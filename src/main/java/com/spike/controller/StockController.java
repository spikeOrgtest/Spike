package com.spike.controller;

import com.spike.dto.StockDTO;
import com.spike.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StockController {

    @Autowired
    private StockService stockService;

    // 주식 시장 페이지
    @GetMapping("/spike/stock/home")
    public String stockMarket(Model model) {
        try {
            // 상위 10개 주식을 가져옵니다.
            List<StockDTO> stockList = stockService.getTopStocks(10);
            model.addAttribute("stockList", stockList);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to load stock data: " + e.getMessage());
        }
        return "investment/stock_market";
    }
}
