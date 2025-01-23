package com.spike.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;

@Repository
public interface AccountRepository extends JpaRepository<AccountDTO, Long> {
	List<AccountDTO> findByOwner(UserDTO user);
}
