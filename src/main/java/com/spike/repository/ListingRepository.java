package com.spike.repository;

import com.spike.dto.Listing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ListingRepository extends JpaRepository<Listing, Integer> {

    // stockId를 기준으로 Listing 조회 (JPA 네이밍 기반 쿼리)
    List<Listing> findByStock_StockId(int stockId);

    // listingId(매물 ID)로 조회 (JPA 네이밍 기반)
    Optional<Listing> findById(int listingId);
}