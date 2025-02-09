package com.spike.service;

import java.util.List;

import com.spike.dto.GiftIconDTO;

public interface GifticonService {

	List<GiftIconDTO> findgifticon();
	
	// 0208 기프티콘 이름으로 기프티콘을 찾는 메서드 추가
	GiftIconDTO findGiftIconByName(String giftIconName);

}
