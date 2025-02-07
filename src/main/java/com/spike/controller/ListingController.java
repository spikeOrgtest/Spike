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
    @PostMapping(value = "/sell", produces = "text/html;charset=UTF-8")
    public ResponseEntity<String> registerListing(
            @RequestParam("sellerAccountId") Long sellerAccountId,
            @RequestParam("stockId") int stockId,
            @RequestParam("quantity") int quantity,
            @RequestParam("price") int price
    ) {
        if (sellerAccountId == null) {
            String script = "<script>alert('❌ 판매자 계좌 ID가 누락되었습니다.');"
                    + "window.location.href='/spike.com/stock/" + stockId + "/order';</script>";
            return ResponseEntity.badRequest().body(script);
        }

        try {
            // 판매자 계좌 조회
            SecuritiesAccountDTO seller = securitiesAccountService.getAccountById(sellerAccountId)
                    .orElseThrow(() -> new IllegalArgumentException("❌ 판매자 계좌를 찾을 수 없습니다."));

            // 주식 정보 조회
            StockDTO stock = stockService.getStockById(stockId)
                    .orElseThrow(() -> new IllegalArgumentException("❌ 주식 정보를 찾을 수 없습니다."));

            // 유효성 검사: 판매 수량 및 가격
            if (quantity <= 0)
                return ResponseEntity.badRequest().body(
                        "<script>alert('❌ 최소 1주 이상 판매해야 합니다.'); window.location.href='/spike.com/stock/" + stockId + "/order';</script>");
            if (price <= 0)
                return ResponseEntity.badRequest().body(
                        "<script>alert('❌ 판매 가격은 1원 이상이어야 합니다.'); window.location.href='/spike.com/stock/" + stockId + "/order';</script>");

            // 보유한 주식 수량 확인
            int availableQuantity = stockHoldingService.getStockQuantity(seller.getAccountId(), stock.getStockId());
            if (availableQuantity < quantity) {
                return ResponseEntity.badRequest().body(
                        "<script>alert('❌ 보유한 주식보다 많이 판매할 수 없습니다. (보유량: " + availableQuantity + "주)');"
                        + "window.location.href='/spike.com/stock/" + stockId + "/order';</script>");
            }

            // 매물 등록 실행
            Listing listing = listingService.createListing(seller, stock, quantity, price);

            // 응답 반환: alert 후 주문 페이지로 리다이렉트
            String script = "<script>alert('매물이 등록되었습니다!');"
                    + "window.location.href='/spike.com/stock/" + stockId + "/order';</script>";
            return ResponseEntity.ok(script);

        } catch (Exception e) {
            String script = "<script>alert('매물 등록 중 오류 발생: " + e.getMessage() + "');"
                    + "window.location.href='/spike.com/stock/" + stockId + "/order';</script>";
            return ResponseEntity.internalServerError().body(script);
        }
    }
    
 // ✅ 매물 구매 (구매자가 선택한 매물을 구매)
    @PostMapping(value = "/buy", produces = "text/html;charset=UTF-8")
    public ResponseEntity<String> buyListing(
            @RequestParam("buyerAccountId") Long buyerAccountId,
            @RequestParam("listingId") int listingId,
            @RequestParam("quantity") int quantity
    ) {
        try {
            SecuritiesAccountDTO buyer = securitiesAccountService.getAccountById(buyerAccountId)
                    .orElseThrow(() -> new IllegalArgumentException("구매자 계좌를 찾을 수 없습니다."));

            Listing listing = listingService.getListingById(listingId)
                    .orElseThrow(() -> new IllegalArgumentException("해당 매물을 찾을 수 없습니다."));

            int stockId = listing.getStock().getStockId();

            if (quantity <= 0 || quantity > listing.getQuantity()) {
                return ResponseEntity.badRequest().body(createAlertScript("❌ 구매 수량이 잘못되었습니다.", stockId));
            }

            int totalCost = listing.getPrice() * quantity;
            if (buyer.getBalance() < totalCost) {
                return ResponseEntity.badRequest().body(createAlertScript("❌ 잔액이 부족합니다.", stockId));
            }

            boolean success = listingService.processPurchase(buyer, listing, quantity);
            return success ? ResponseEntity.ok(createAlertScript("구매가 완료되었습니다!", stockId))
                           : ResponseEntity.badRequest().body(createAlertScript("구매 처리에 실패했습니다.", stockId));

        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(createAlertScript("오류 발생: " + e.getMessage(), 0));
        }
    }

    // ✅ 공통 알림 메시지 생성 함수
    private String createAlertScript(String message, int stockId) {
        return "<script>alert('" + message + "');"
                + "window.location.href='/spike.com/stock/" + stockId + "/order';</script>";
    }

}
