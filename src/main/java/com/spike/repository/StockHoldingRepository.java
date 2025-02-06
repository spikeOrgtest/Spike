package com.spike.repository;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.StockDTO;
import com.spike.dto.StockHolding;
import com.spike.dto.UserDTO;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StockHoldingRepository extends JpaRepository<StockHolding, Integer> {

	@Query("SELECT COALESCE(SUM(sh.quantity), 0) FROM StockHolding sh WHERE sh.holder.accountId = :sellerId AND sh.stock.stockId = :stockId")
	int getStockQuantity(@Param("sellerId") Long sellerId, @Param("stockId") int stockId);

}
