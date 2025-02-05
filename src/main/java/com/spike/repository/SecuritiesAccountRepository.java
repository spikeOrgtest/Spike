package com.spike.repository;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.dto.UserDTO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SecuritiesAccountRepository extends JpaRepository<SecuritiesAccountDTO, Long> {

	// UserDTO 객체 기반으로 계좌 조회
	 Optional<SecuritiesAccountDTO> findByUser(UserDTO user);

}
