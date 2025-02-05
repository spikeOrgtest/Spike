package com.spike.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.apache.ibatis.annotations.Param;
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
	//@Query("SELECT a FROM AccountDTO a WHERE a.accountNumber = ?1")
	Optional<AccountDTO> findByAccountNumber(String accountNumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.oneLimit=?1 where a.accountNumber=?2")
	void Oneupdateaccount(Long oneLimit, String accountNumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.dayLimit=?1 where a.accountNumber=?2")
	void Dayupdateaccount(Long dayLimit, String accountNumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.accountPassword=?1 where a.accountNumber=?2")
	void Passwordupdateaccount(String accountPassword, String accountNumber);

	@Transactional // 여러번 패스워드 변경 시 조회 실패하는거 방지
	@Query("select a from AccountDTO a where a.accountNumber=?1")
	Optional<AccountDTO> findByAccount(String account_number);

	@Modifying
	@Transactional
	@Query("delete from AccountDTO a where a.accountNumber=?1")
	public void accountsecession(String accountNumber);

	@Query("SELECT a FROM AccountDTO a WHERE a.accountState=ACTIVE")
	List<AccountDTO> findByDeletedFalse();

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.balance=:#{#account.balance}, "
			+ "a.lastInterestDate=:#{#account.lastInterestDate} " + "where a.accountId=:#{#account.accountId}")
	void updateAccount(@Param("account") AccountDTO account);

}
