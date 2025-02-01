package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.CardDTO;

@Repository
public interface CardRepository extends JpaRepository<CardDTO, Long> {
}
