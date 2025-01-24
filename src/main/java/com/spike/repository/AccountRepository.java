package com.spike.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountDTO;

@Repository
public interface AccountRepository extends JpaRepository<AccountDTO, Long> {

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

}