package com.spike.dao;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.spikeDTO;

public interface spikeRepository extends JpaRepository<spikeDTO, Integer> {

	@Query("select s from spikeDTO s where s.login_id=?1")
	public Optional<spikeDTO> findid(String id);

	@Query("select s from spikeDTO s where s.login_id=?1 and s.status='ACTIVE'")
	public spikeDTO loginCheck(String login_id);
	
	@Query("select s from spikeDTO s where s.name=?1 and s.phone=?2")
	public spikeDTO findUserid(String name, String phone);
	
	@Query("select s from spikeDTO s where s.login_id=?1 and s.name=?2")
	public spikeDTO findUserpwd(String login_id, String name);
	
	@Query("select s from spikeDTO s where s.login_id=?1 and s.name=?2")
	public spikeDTO findMember(String login_id, String name);
	
	@Modifying
	@Transactional
	@Query("update spikeDTO s set s.password = ?1 where s.login_id = ?2 and s.name = ?3")
	public int changePwd(String password, String login_id, String name);

}
