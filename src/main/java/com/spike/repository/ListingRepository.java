package com.spike.repository;

import com.spike.dto.Listing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ListingRepository extends JpaRepository<Listing, Integer> {

    // 특정 주식 ID에 대한 매물 조회 (JOIN)
    @Query("SELECT l FROM Listing l JOIN l.stock s WHERE s.stockId = :stockId")
    List<Listing> findByStock_StockId(@Param("stockId") int stockId);

    // 매물 ID로 조회
    Optional<Listing> findById(int listingId);

    // 특정 판매자의 특정 주식(stockId)에 대해 현재 등록된 총 매물 수량 조회
    @Query("SELECT COALESCE(SUM(l.quantity), 0) FROM Listing l WHERE l.seller.accountId = :sellerAccountId AND l.stock.stockId = :stockId")
    int getTotalListedQuantity(@Param("sellerAccountId") Long sellerAccountId, @Param("stockId") int stockId);
}
