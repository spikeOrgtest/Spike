package com.spike.service;

import com.spike.dto.Listing;
import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.repository.ListingRepository;
import com.spike.repository.StockHoldingRepository;
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
}