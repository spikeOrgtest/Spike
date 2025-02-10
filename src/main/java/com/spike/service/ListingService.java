package com.spike.service;

import com.spike.dto.Listing;
import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;

import java.util.List;
import java.util.Optional;

public interface ListingService {

    //  매물 등록 (판매자가 주식을 시장에 올림)
    Listing createListing(SecuritiesAccountDTO seller, StockDTO stock, int quantity, int price);

    // 🔹특정 주식 ID의 매물 조회 (판매 중인 주식 목록)
    List<Listing> getListingsByStockId(int stockId);

    //  전체 매물 조회
    List<Listing> getAllListings();

    //  특정 매물 ID 조회
    Optional<Listing> getListingById(int listingId);

    //  매물 삭제 (거래 완료 후 제거)
    void deleteListing(int listingId);

    //  매물 구매 처리
    boolean processPurchase(SecuritiesAccountDTO buyer, Listing listing, int quantity);

    //  보유 수량 초과 여부 확인 (누적 검증)
    boolean isListingQuantityExceedingLimit(SecuritiesAccountDTO seller, StockDTO stock, int newListingQuantity);
    
 // 판매 중인 주식 수량 조회 (추가)
    int getTotalListedQuantity(Long sellerAccountId, int stockId);
    
 //  매물 취소 기능 추가 
    void cancelListing(Listing listing);
    
    

}
