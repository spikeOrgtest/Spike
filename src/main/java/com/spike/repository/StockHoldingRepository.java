package com.spike.repository;

import com.spike.dto.StockHolding;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface StockHoldingRepository extends JpaRepository<StockHolding, Integer> {

    
      //특정 계좌(판매자 또는 보유자)가 특정 주식에 대해 보유한 총 수량을 조회합니다.
   
     
    @Query("SELECT COALESCE(SUM(sh.quantity), 0) FROM StockHolding sh WHERE sh.holder.accountId = :sellerId AND sh.stock.stockId = :stockId")
    int getStockQuantity(@Param("sellerId") Long sellerId, @Param("stockId") int stockId);

   //특정 계좌와 주식에 대해, 보유 수량을 증가시킵니다.이미 보유 기록이 존재한다면 해당 기록의 수량을 업데이트
    @Modifying
    @Query("UPDATE StockHolding sh SET sh.quantity = sh.quantity + :quantity WHERE sh.holder.accountId = :accountId AND sh.stock.stockId = :stockId")
    int addStockToAccount(@Param("accountId") Long accountId, @Param("stockId") int stockId, @Param("quantity") int quantity);

    //특정 계좌와 주식에 대해, 보유 수량을 감소시킵니다.
    @Modifying
    @Query("UPDATE StockHolding sh SET sh.quantity = sh.quantity - :quantity WHERE sh.holder.accountId = :accountId AND sh.stock.stockId = :stockId")
    int reduceStockFromAccount(@Param("accountId") Long accountId, @Param("stockId") int stockId, @Param("quantity") int quantity);
}
