package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.dto.AccountTestDTO;

public interface AccountTestRepository extends JpaRepository<AccountTestDTO, Long> {

}
