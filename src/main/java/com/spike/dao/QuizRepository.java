package com.spike.dao;

import java.util.Optional;


import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.QuizDTO;


public interface QuizRepository extends JpaRepository<QuizDTO, Integer> {

	/*
	@Query("select q from QuizDTO q where s.login_id=?1")
	public Optional<QuizDTO> findid(String id);

	@Query("select s from QuizDTO s where s.login_id=?1 and s.status='ACTIVE'")
	public QuizDTO loginCheck(String login_id);
	
	@Query("select s from QuizDTO s where s.name=?1 and s.phone=?2")
	public QuizDTO findUserid(String name, String phone);
	
	@Query("select s from QuizDTO s where s.login_id=?1 and s.name=?2")
	public QuizDTO findUserpwd(String login_id, String name);
	
	@Query("select s from QuizDTO s where s.login_id=?1 and s.name=?2")
	public QuizDTO findMember(String login_id, String name);
	
	@Modifying
	@Transactional
	@Query("update QuizDTO s set s.password = ?1 where s.login_id = ?2 and s.name = ?3")
	public int changePwd(String password, String login_id, String name); */

}
