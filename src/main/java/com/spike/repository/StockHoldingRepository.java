package com.spike.repository;

import com.spike.dto.StockHolding;
import com.spike.dto.UserDTO;
import com.spike.dto.StockDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StockHoldingRepository extends JpaRepository<StockHolding, Integer> {

    @Query("SELECT COALESCE(SUM(sh.quantity), 0) FROM StockHolding sh WHERE sh.holder = :seller AND sh.stock = :stock")
    Integer getStockQuantity(@Param("seller") UserDTO seller, @Param("stock") StockDTO stock);
}
