package com.spike.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;

@Repository
public interface AccountRepository extends JpaRepository<AccountDTO, Long> {
	// UserDTO user의 계좌 리스트를 반환하는 쿼리 메서드
	List<AccountDTO> findByOwner(UserDTO user);

	// 계좌번호를 검색해서 계좌 엔티티를 반환하는 쿼리 메서드 -> 필드명이 account_number라 쿼리메서드 불가능. JPQL사용
	@Query("SELECT a FROM AccountDTO a WHERE a.account_number = ?1")
	Optional<AccountDTO> findByAccountNumber(String accountNumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.one_limit = ?1 where a.account_number =?2")
	public void Oneupdateaccount(Long one_limit, String accountnumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.day_limit = ?1 where a.account_number =?2")
	public void Dayupdateaccount(Long day_limit, String accountnumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.account_password = ?1 where a.account_number =?2")
	public void Passwordupdateaccount(String account_password, String account_number);

	@Transactional // 여러번 패스워드 변경 시 조회 실패하는거 방지
	@Query("select a from AccountDTO a where a.account_number=?1")
	Optional<AccountDTO> findByAccount(String account_number);

}
