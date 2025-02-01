package com.spike.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;

@Repository
public interface AccountRepository extends JpaRepository<AccountDTO, Long> {

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.oneLimit = ?1 where a.accountNumber =?2")
	void Oneupdateaccount(Long oneLimit, String accountNumber);
	
	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.dayLimit = ?1 where a.accountNumber =?2")
	void Dayupdateaccount(Long dayLimit, String accountNumber);

	@Modifying
	@Transactional
	@Query("update AccountDTO a set a.accountPassword = ?1 where a.accountNumber =?2")
	void Passwordupdateaccount(String accountPassword, String accountNumber);

	@Modifying
	@Transactional
	@Query("delete from UserDTO s where s.loginId=?1")
	public void secession(String loginId);

	@Modifying
	@Transactional
	@Query("delete from AccountDTO a where a.accountNumber=?1")
	public void accountsecession(String accountNumber);

	@Query("SELECT a FROM AccountDTO a WHERE a.deleted = false")
	List<AccountDTO> findByDeletedFalse();

	@Modifying	
	@Transactional
	@Query("update AccountDTO a set a.balance = :#{#account.balance}, " +
		   "a.lastInterestDate = :#{#account.lastInterestDate} " +
		   "where a.accountId = :#{#account.accountId}")
	void updateAccount(@Param("account") AccountDTO account);

}