package com.spike.controller;

import com.spike.dto.StockDTO;
import com.spike.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class StockController {

    @Autowired
    private StockService stockService;

    // 1. 주식 시장 페이지 (stock_market.jsp)
    @GetMapping("spike/stock/home")
    public String stockMarket(Model model) {
        try {
            List<StockDTO> stockList = stockService.getAllStocks();
            model.addAttribute("pageTitle", "주식 시장");
            model.addAttribute("stockList", stockList);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to load stock data: " + e.getMessage());
        }
        return "investment/stock_market";
    }

    // 2. 주식 주문 페이지 (stock_order.jsp)
    @GetMapping("spike/stock/order")
    public String stockTrade(
        @RequestParam(name = "stockId", required = false) String stockId,
        Model model
    ) {
        if (stockId == null) {
            model.addAttribute("errorMessage", "Stock ID is required.");
            return "investment/stock_order";
        }

        try {
            StockDTO stock = stockService.getStockById(Integer.parseInt(stockId));
            model.addAttribute("stock", stock);
            model.addAttribute("pageTitle", "주식 거래");
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to load stock data: " + e.getMessage());
        }
        return "investment/stock_order";
    }

    // 3. 주식 계좌 자산 페이지 (stock_account_assets.jsp)
    @GetMapping("spike/stock/account/assets")
    public String accountAssets(Model model) {
        try {
            model.addAttribute("pageTitle", "자산 현황");
            model.addAttribute("accountNumber", "123-456-789");
            model.addAttribute("totalAssets", 50000000);
            model.addAttribute("availableBalance", 10000000);
            model.addAttribute("investedAmount", 40000000);
            model.addAttribute("profit", 2000000);

            List<StockDTO> stockList = stockService.getAllStocks();
            model.addAttribute("stockList", stockList);
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Failed to load account data: " + e.getMessage());
        }
        return "investment/stock_account_assets";
    }
}
