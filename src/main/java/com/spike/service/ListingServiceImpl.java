package com.spike.service;

import com.spike.dto.Listing;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.dto.StockHolding;
import com.spike.dto.StockTransaction;
import com.spike.repository.ListingRepository;
import com.spike.repository.StockHoldingRepository;
import com.spike.repository.StockTransactionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class ListingServiceImpl implements ListingService {

    @Autowired
    private ListingRepository listingRepository;

    @Autowired
    private StockHoldingRepository stockHoldingRepository;
    
    @Autowired
    private StockTransactionRepository stockTransactionRepository;

    // 판매자가 주식을 판매 등록하는 로직
    @Override
    @Transactional
    public Listing createListing(SecuritiesAccountDTO seller, StockDTO stock, int quantity, int price) {
        if (quantity <= 0) {
            throw new IllegalArgumentException("판매 수량은 1주 이상이어야 합니다.");
        }
        if (price <= 0) {
            throw new IllegalArgumentException("판매 가격은 1원 이상이어야 합니다.");
        }

        // 판매자가 주식 보유량 확인
        int ownedQuantity = stockHoldingRepository.getStockQuantity(seller.getAccountId(), stock.getStockId());

        

        if (ownedQuantity < quantity) {
            throw new IllegalArgumentException("보유한 주식 수량이 부족합니다.");
        }

        // 매물 등록
        Listing listing = new Listing();
        listing.setSeller(seller);
        listing.setStock(stock);
        listing.setQuantity(quantity);
        listing.setPrice(price);
        return listingRepository.save(listing);
    }

    // 특정 주식 ID의 매물 조회
    @Override
    public List<Listing> getListingsByStockId(int stockId) {
        return listingRepository.findByStock_StockId(stockId);
    }

    // 전체 매물 조회
    @Override
    public List<Listing> getAllListings() {
        return listingRepository.findAll();
    }

    // 특정 매물 조회
    @Override
    public Optional<Listing> getListingById(int listingId) {
        return listingRepository.findById(listingId);
    }

    // 매물 삭제
    @Override
    public void deleteListing(int listingId) {
        listingRepository.deleteById(listingId);
    }
    
 //  구매 처리 (매수자가 매물을 구매할 때 실행)
    @Override
    @Transactional
    public boolean processPurchase(SecuritiesAccountDTO buyer, Listing listing, int quantity) {
        int totalCost = listing.getPrice() * quantity;
        
        if(buyer.getAccountId().equals(listing.getSeller().getAccountId())){
            throw new IllegalArgumentException("자기 자신의 매물을 구매할 수 없습니다.");
        }

        // 1️ 예수금 확인
        if (buyer.getBalance() < totalCost) {
            throw new IllegalArgumentException("❌ 잔액이 부족합니다.");
        }

        // 2️ 예수금 차감 & 판매자에게 금액 지급
        buyer.setBalance(buyer.getBalance() - totalCost);
        listing.getSeller().setBalance(listing.getSeller().getBalance() + totalCost);

        // 3️ 구매자 주식 추가
        // 기존의 업데이트 쿼리 사용 후, 영향받은 행 수 확인
        int updateCount = stockHoldingRepository.addStockToAccount(buyer.getAccountId(), listing.getStock().getStockId(), quantity);
        if (updateCount == 0) {
            // 기존 보유 기록이 없으므로, 새로운 StockHolding 엔티티를 생성하여 저장
            StockHolding newHolding = new StockHolding();
            newHolding.setHolder(buyer);
            newHolding.setStock(listing.getStock());
            newHolding.setQuantity(quantity);
            stockHoldingRepository.save(newHolding);
        }

        // 4️ 판매자의 주식 감소
        stockHoldingRepository.reduceStockFromAccount(listing.getSeller().getAccountId(), listing.getStock().getStockId(), quantity);

        // 5️ 거래 내역 저장
        StockTransaction transaction = new StockTransaction();
        transaction.setBuyer(buyer);
        transaction.setSeller(listing.getSeller());
        transaction.setStock(listing.getStock());
        transaction.setQuantity(quantity);
        transaction.setPrice(listing.getPrice());

        stockTransactionRepository.save(transaction);

        // 6️ 매물 업데이트 (부분 체결 or 삭제)
        if (listing.getQuantity() == quantity) {
            listingRepository.deleteById(listing.getId()); // 전량 체결 시 삭제
        } else {
            listing.setQuantity(listing.getQuantity() - quantity); // 부분 체결 시 남은 수량 업데이트
            listingRepository.save(listing);
        }

        return true;
    }

}