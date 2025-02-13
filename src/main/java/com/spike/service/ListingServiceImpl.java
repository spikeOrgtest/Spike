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
	private StockService stockService; 

	@Autowired
	private ListingRepository listingRepository;

	@Autowired
	private StockHoldingRepository stockHoldingRepository;

	@Autowired
	private StockTransactionRepository stockTransactionRepository;

	// 🔹 매물 등록 (판매자가 주식을 시장에 올림)
	@Override
	@Transactional
	public Listing createListing(SecuritiesAccountDTO seller, StockDTO stock, int quantity, int price) {
		if (quantity <= 0) {
			throw new IllegalArgumentException("판매 수량은 1주 이상이어야 합니다.");
		}
		if (price <= 0) {
			throw new IllegalArgumentException("판매 가격은 1원 이상이어야 합니다.");
		}

		// 🔹 보유 주식 초과 여부 검증 (누적 확인)
		if (isListingQuantityExceedingLimit(seller, stock, quantity)) {
			throw new IllegalStateException("보유한 주식 수량을 초과하여 매물을 등록할 수 없습니다.");
		}

		// 🔹 매물 등록
		Listing listing = new Listing();
		listing.setSeller(seller);
		listing.setStock(stock);
		listing.setQuantity(quantity);
		listing.setPrice(price);

		return listingRepository.save(listing);
	}

	// 🔹 보유 수량 초과 여부 확인 (누적 검증)
	@Override
	public boolean isListingQuantityExceedingLimit(SecuritiesAccountDTO seller, StockDTO stock, int newListingQuantity) {
		// 1️ 판매자의 보유 주식 수량 조회
		int ownedQuantity = stockHoldingRepository.getStockQuantity(seller.getAccountId(), stock.getStockId());

		// 2️ 현재 등록된 매물 총합 조회
		int totalListedQuantity = listingRepository.getTotalListedQuantity(seller.getAccountId(), stock.getStockId());

		// 3️ 새로운 매물 수량 추가 후 보유량 초과 여부 확인
		return (totalListedQuantity + newListingQuantity) > ownedQuantity;
	}

	// 🔹 특정 주식 ID의 매물 조회
	@Override
	public List<Listing> getListingsByStockId(int stockId) {
		return listingRepository.findByStock_StockId(stockId);
	}

	//  전체 매물 조회
	@Override
	public List<Listing> getAllListings() {
		return listingRepository.findAll();
	}

	//  특정 매물 조회
	@Override
	public Optional<Listing> getListingById(int listingId) {
		return listingRepository.findById(listingId);
	}

	//  매물 삭제
	@Override
	public void deleteListing(int listingId) {
		listingRepository.deleteById(listingId);
	}

	//  매물 구매 처리
	@Override
	@Transactional
	public boolean processPurchase(SecuritiesAccountDTO buyer, Listing listing, int quantity) {
		int totalCost = listing.getPrice() * quantity;

		if (buyer.getAccountId().equals(listing.getSeller().getAccountId())) {
			throw new IllegalArgumentException("자기 자신의 매물을 구매할 수 없습니다.");
		}

		// 🔸 예수금 확인
		if (buyer.getBalance() < totalCost) {
			throw new IllegalArgumentException("잔액이 부족합니다.");
		}

		// 🔸 잔액 차감 & 판매자 금액 추가
		buyer.setBalance(buyer.getBalance() - totalCost);
		listing.getSeller().setBalance(listing.getSeller().getBalance() + totalCost);

		// 🔸 구매자 주식 추가
		StockHolding buyerHolding = stockHoldingRepository.findBySecuritiesAccountIdAndStockId(
				buyer.getAccountId(), listing.getStock().getStockId()).orElse(null);

		if (buyerHolding == null) {
			buyerHolding = new StockHolding();
			buyerHolding.setHolder(buyer);
			buyerHolding.setStock(listing.getStock());
			buyerHolding.setQuantity(quantity);
			stockHoldingRepository.save(buyerHolding);
		} else {
			buyerHolding.setQuantity(buyerHolding.getQuantity() + quantity);
			stockHoldingRepository.save(buyerHolding);
		}

		//  판매자의 주식 감소
		stockHoldingRepository.reduceStockFromAccount(listing.getSeller().getAccountId(), listing.getStock().getStockId(), quantity);

		// 거래 내역 저장 (StockTransaction)
		StockTransaction transaction = new StockTransaction();
		transaction.setBuyer(buyer);
		transaction.setSeller(listing.getSeller());
		transaction.setStock(listing.getStock());
		transaction.setQuantity(quantity);
		transaction.setPrice(listing.getPrice());
		stockTransactionRepository.save(transaction);

		// 매물 업데이트 (잔여 수량 차감 혹은 삭제)
		if (listing.getQuantity() == quantity) {
			listingRepository.deleteById(listing.getId());
		} else {
			listing.setQuantity(listing.getQuantity() - quantity);
			listingRepository.save(listing);
		}

		// 현재가 갱신 호출 제거!
		// stockService.updateStockCurrentPrice(listing.getStock());

		return true;
	}

	@Override //listing+stockholding의 총 주식보유량
	public int getTotalListedQuantity(Long sellerAccountId, int stockId) {
		return listingRepository.getTotalListedQuantity(sellerAccountId, stockId);
	}

	@Override
	@Transactional
	public void cancelListing(Listing listing) {
		//  매물 삭제 
		listingRepository.delete(listing);
	}


}
