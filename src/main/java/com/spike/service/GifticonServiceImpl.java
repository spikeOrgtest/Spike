package com.spike.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dto.GiftIconDTO;
import com.spike.repository.GiftIconRepository;

@Service
public class GifticonServiceImpl implements GifticonService {

	@Autowired
	private GiftIconRepository gifticonrepo;

	@Override
	public List<GiftIconDTO> findgifticon() {
		return gifticonrepo.findAll();
	}

	@Override
	public GiftIconDTO findGiftIconByName(String giftIconName) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
