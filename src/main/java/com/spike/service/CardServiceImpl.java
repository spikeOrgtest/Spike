package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.CardDAO;
import com.spike.dto.CardDTO;

@Service
public class CardServiceImpl implements CardService {

	@Autowired
	private CardDAO carddao;
	
	@Override
	public void createCard(CardDTO s) {
		this.carddao.createCard(s);
	}
}