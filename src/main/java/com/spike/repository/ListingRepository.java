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

    // ANSI JOIN을 사용하여 주어진 stockId에 해당하는 Listing 조회
    @Query("SELECT l FROM Listing l JOIN l.stock s WHERE s.stockId = :stockId")
    List<Listing> findByStock_StockId(@Param("stockId") int stockId);

    // listingId(매물 ID)로 조회 (JPA 네이밍 기반)
    Optional<Listing> findById(int listingId);
}
