package com.spike.repository;

import com.spike.dto.StockHolding;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StockHoldingRepository extends JpaRepository<StockHolding, Integer> {

    // 특정 계좌(판매자)가 특정 주식을 보유한 총 수량 조회
    @Query("SELECT COALESCE(SUM(sh.quantity), 0) FROM StockHolding sh WHERE sh.holder.accountId = :sellerId AND sh.stock.stockId = :stockId")
    int getStockQuantity(@Param("sellerId") Long sellerId, @Param("stockId") int stockId);

    // 보유 수량 증가
    @Modifying
    @Query("UPDATE StockHolding sh SET sh.quantity = sh.quantity + :quantity WHERE sh.holder.accountId = :accountId AND sh.stock.stockId = :stockId")
    int addStockToAccount(@Param("accountId") Long accountId, @Param("stockId") int stockId, @Param("quantity") int quantity);

    // 보유 수량 감소
    @Modifying
    @Query("UPDATE StockHolding sh SET sh.quantity = sh.quantity - :quantity WHERE sh.holder.accountId = :accountId AND sh.stock.stockId = :stockId")
    int reduceStockFromAccount(@Param("accountId") Long accountId, @Param("stockId") int stockId, @Param("quantity") int quantity);

    // 특정 계좌의 특정 주식 보유 여부 조회
    @Query("SELECT s FROM StockHolding s WHERE s.holder.accountId = :securitiesAccountId AND s.stock.stockId = :stockId")
    Optional<StockHolding> findBySecuritiesAccountIdAndStockId(@Param("securitiesAccountId") Long securitiesAccountId, 
                                                                @Param("stockId") int stockId);
}
