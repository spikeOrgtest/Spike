package com.spike.repository;

import com.spike.dto.StockDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface StockRepository extends JpaRepository<StockDTO, Integer> {

    // 주식 이름으로 검색 (대소문자 무시, 전체 주식 대상)
    List<StockDTO> findByCompanyNameContainingIgnoreCase(String companyName);
    
    // 모든 주식 데이터를 가져오는 쿼리 (native query)
    @Query(value = "SELECT * FROM stock", nativeQuery = true)
    List<StockDTO> findAllStocks();
}
