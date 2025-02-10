package com.spike.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.GiftIconDTO;

public interface GiftIconRepository extends JpaRepository<GiftIconDTO, Long> {

//	@Query("select g from GiftIconDTO g where")
//	List<GiftIconDTO> findgiftion();
	
	// 기프티콘 ID을 통해 기프티콘을 조회하는 메서드
    GiftIconDTO findByGiftIconId(String giftconName);
    
    // GiftIcon ID로 기프티콘을 조회하고 Optional로 반환
    Optional<GiftIconDTO> findBygiftIconId(Long giftIconId);
    
    // 기프티콘 이름으로 기프티콘을 조회하는 메서드
    GiftIconDTO findByGiftconName(String giftconName);
}
