package com.spike.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spike.dto.AccountTestDTO;
@Repository
public interface AccountTestRepository extends JpaRepository<AccountTestDTO, Long> {

	//@Query("select a from AccountTestDTO a WHERE a.owner.user_id = ?1")
	//List<AccountTestDTO> getAccountList(Long user_id);

	//@Query(value = "SELECT * FROM sampleaccount WHERE owner_user_id = :userId", nativeQuery = true)
	//List<AccountTestDTO> findByOwnerUserIdNative(@Param("userId") Long userId);
	
	@Query(value = "SELECT * FROM sampleaccount WHERE owner_user_id = ?1", nativeQuery = true)
	List<Object[]> findRawResults(@Param("userId") Long userId);

	@Query(value = "SELECT * FROM sampleaccount", nativeQuery = true)
	List<AccountTestDTO> findAccounts();

	@Query(value = "SELECT count(*) FROM sampleaccount WHERE owner_user_id = 1 AND dtype = 'SampleBasicAccount'", nativeQuery = true)
	int cntAccounts();

	@Query(value = "SELECT count(*) FROM sampleaccount WHERE owner_user_id = 1", nativeQuery = true)
	int cntAccountsByOwnerUserId();

	@Query(value = "SELECT count(*) FROM sampleaccount WHERE dtype = 'AccountTestDTO'", nativeQuery = true)
	int cntAccountsWithDtype();

	@Query(value = "SELECT count(*) FROM sampleaccount", nativeQuery = true)
	int cntAll();
}
