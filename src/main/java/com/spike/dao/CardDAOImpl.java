package com.spike.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spike.dto.CardDTO;
import com.spike.repository.CardRepository;

@Repository
public class CardDAOImpl implements CardDAO {

	@Autowired
	private CardRepository cardrepo;
	
	@Override
	public void createCard(CardDTO s) {
		this.cardrepo.save(s);
	}
}
