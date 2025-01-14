package com.spike.controller;

import org.springframework.ui.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.spike.dto.StockDTO;
import com.spike.service.StockService;

@Controller
public class StockController {

    @Autowired
    private StockService stockService;

    // 주식 시장 페이지
    @GetMapping("/spike/stock/home")
    public String stockMarket(Model model) {
        try {
            // StockService를 통해 DB에서 데이터를 가져옵니다.
            List<StockDTO> stockList = stockService.getAllStocks();
            model.addAttribute("pageTitle", "주식 시장");
            model.addAttribute("stockList", stockList); // UI로 전달
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to load stock data: " + e.getMessage());
        }
        return "investment/stock_market"; // stock_market.jsp로 연결
    }
}