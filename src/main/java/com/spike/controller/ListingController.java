package com.spike.controller;

import com.spike.dto.Listing;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.service.ListingService;
import com.spike.service.SecuritiesAccountService;
import com.spike.service.StockService;
import com.spike.service.StockHoldingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/spike.com/listing")
public class ListingController {

    @Autowired
    private ListingService listingService;

    @Autowired
    private SecuritiesAccountService securitiesAccountService;

    @Autowired
    private StockService stockService;

    @Autowired
    private StockHoldingService stockHoldingService;

    // ✅ 매물 등록 (판매)
    @PostMapping("/sell")
    public ResponseEntity<?> registerListing(
            @RequestParam("sellerAccountId") Long sellerAccountId,
            @RequestParam("stockId") int stockId,
            @RequestParam("quantity") int quantity,
            @RequestParam("price") int price
    ) {
        if (sellerAccountId == null) {
            return ResponseEntity.badRequest().body("❌ 판매자 계좌 ID가 누락되었습니다.");
        }

        try {
        	
            // 판매자 계좌 조회
            SecuritiesAccountDTO seller = securitiesAccountService.getAccountById(sellerAccountId)
                    .orElseThrow(() -> new IllegalArgumentException("❌ 판매자 계좌를 찾을 수 없습니다."));

            // 주식 정보 조회
            StockDTO stock = stockService.getStockById(stockId)
                    .orElseThrow(() -> new IllegalArgumentException("❌ 주식 정보를 찾을 수 없습니다."));
            
            
            int availableQuantity = stockHoldingService.getStockQuantity(seller, stock);


            // 유효성 검사: 판매 수량 및 가격
            if (quantity <= 0) return ResponseEntity.badRequest().body("❌ 최소 1주 이상 판매해야 합니다.");
            if (price <= 0) return ResponseEntity.badRequest().body("❌ 판매 가격은 1원 이상이어야 합니다.");
            
            // 보유 주식 수량 확인
            Integer stockQuantity = stockHoldingService.getStockQuantity(seller, stock);

            if (availableQuantity < quantity) {
                return ResponseEntity.badRequest().body("❌ 보유한 주식보다 많이 판매할 수 없습니다. (보유량: " + availableQuantity + "주)");
            }

            // 매물 등록 실행
            Listing listing = listingService.createListing(seller, stock, quantity, price);

            // 응답 반환
            Map<String, Object> response = new HashMap<>();
            response.put("message", "매물이 등록되었습니다!");
            response.put("listingId", listing.getId());
            response.put("stockId", listing.getStock().getStockId());
            response.put("quantity", listing.getQuantity());
            response.put("price", listing.getPrice());

            return ResponseEntity.ok(response);

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("❌ 매물 등록 중 오류 발생: " + e.getMessage());
        }
    }
}
