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

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

	//  매물 등록 (판매)
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
	
	// 매물 구매
	@PostMapping(value = "/buy", produces = "text/html;charset=UTF-8")
	public ResponseEntity<String> buyListing(
	        @RequestParam("buyerAccountId") Long buyerAccountId,
	        @RequestParam("listingId") String listingIds, // 쉼표로 구분된 여러 ID
	        @RequestParam("quantity") int totalQuantity,
	        int stockId
	        ) {
	    try {
	        SecuritiesAccountDTO buyer = securitiesAccountService.getAccountById(buyerAccountId)
	                .orElseThrow(() -> new IllegalArgumentException("구매자 계좌를 찾을 수 없습니다."));
	        
	        List<Integer> listingIdList = Arrays.stream(listingIds.split(","))
	                .map(String::trim)
	                .filter(s -> !s.isEmpty())
	                .map(Integer::parseInt)
	                .collect(Collectors.toList());

	        int remainingQuantity = totalQuantity;
	        int totalCost = 0;
	        
	        // 거래 실행 중 마지막 체결 가격을 저장할 변수
	        int finalExecutedPrice = 0;

	        // 우선, 전체 주문이 체결 가능한지 확인
	        for (int id : listingIdList) {
	            Listing listing = listingService.getListingById(id)
	                    .orElseThrow(() -> new IllegalArgumentException("해당 매물을 찾을 수 없습니다."));
	            int available = listing.getQuantity();
	            int purchaseQuantity = Math.min(available, remainingQuantity);
	            if (purchaseQuantity <= 0) {
	                continue;
	            }
	            totalCost += listing.getPrice() * purchaseQuantity;
	            remainingQuantity -= purchaseQuantity;
	        }
	        
	        if (remainingQuantity > 0) {
	            return ResponseEntity.badRequest().body(createAlertScript("❌ 구매 가능한 주식 수량이 부족합니다.", stockId));
	        }
	        
	        if (buyer.getBalance() < totalCost) {
	            return ResponseEntity.badRequest().body(createAlertScript("❌ 잔액이 부족합니다.", stockId));
	        }
	        
	        // 실제 구매 처리: 각 매물별로 순차적으로 구매하며, 마지막 거래 가격 기록
	        remainingQuantity = totalQuantity;
	        boolean allSuccess = true;
	        for (int id : listingIdList) {
	            if (remainingQuantity <= 0) break;

	            Listing listing = listingService.getListingById(id)
	                    .orElseThrow(() -> new IllegalArgumentException("해당 매물을 찾을 수 없습니다."));

	            int available = listing.getQuantity();
	            int purchaseQuantity = Math.min(available, remainingQuantity);
	            if (purchaseQuantity <= 0) {
	                continue;
	            }

	            // 각 거래의 체결 가격을 기록 (낮은 가격부터 처리되다가 마지막에 높은 가격이 될 것임)
	            finalExecutedPrice = listing.getPrice();
	            
	            boolean success = listingService.processPurchase(buyer, listing, purchaseQuantity);
	            if (!success) {
	                allSuccess = false;
	                break;
	            }
	            remainingQuantity -= purchaseQuantity;
	        }
	        
	        // 모든 거래가 완료된 후, 마지막 체결 가격(예: 300,000원)으로 현재가를 업데이트
	        if (finalExecutedPrice != 0) {
	            StockDTO stock = stockService.getStockById(stockId)
	                .orElseThrow(() -> new IllegalArgumentException("해당 종목을 찾을 수 없습니다."));
	            stockService.updateStockCurrentPrice(stock, finalExecutedPrice);
	        }

	        return allSuccess 
	                ? ResponseEntity.ok(createAlertScript("구매가 완료되었습니다!", stockId))
	                : ResponseEntity.badRequest().body(createAlertScript("구매 처리에 실패했습니다.", stockId));
	        
	    } catch (Exception e) {
	        return ResponseEntity.internalServerError().body(createAlertScript("오류 발생: " + e.getMessage(), stockId));
	    }
	}



	//  공통 알림 메시지 생성 함수
	private String createAlertScript(String message, int stockId) {
		return "<script>alert('" + message + "');"
				+ "window.location.href='/spike.com/stock/" + stockId + "/order';</script>";
	}


	//  매물 취소(삭제) API
	@PostMapping(value = "/cancel", produces = "text/html;charset=UTF-8")
	public ResponseEntity<String> cancelListing(
			@RequestParam("sellerAccountId") Long sellerAccountId,
			@RequestParam("listingId") int listingId
			) {
		try {
			// 1️ 매물 조회
			Listing listing = listingService.getListingById(listingId)
					.orElseThrow(() -> new IllegalArgumentException("❌ 해당 매물을 찾을 수 없습니다."));

			// 2️ 판매자 본인인지 검증
			if (!listing.getSeller().getAccountId().equals(sellerAccountId)) {
				return ResponseEntity.badRequest().body(
						"<script>alert('❌ 해당 매물의 판매자가 아닙니다.'); window.location.href='/spike.com/stock/" + listing.getStock().getStockId() + "/order';</script>");
			}

			// 3️ 매물 삭제 실행
			listingService.cancelListing(listing);

			return ResponseEntity.ok(
					"<script>alert('✅ 매물이 취소되었습니다.'); window.location.href='/spike.com/stock/" + listing.getStock().getStockId() + "/order';</script>");

		} catch (Exception e) {
			return ResponseEntity.internalServerError().body(
					"<script>alert('❌ 매물 취소 중 오류 발생: " + e.getMessage() + "'); window.location.href='/spike.com/stock/" + listingId + "/order';</script>");
		}
	}



}
