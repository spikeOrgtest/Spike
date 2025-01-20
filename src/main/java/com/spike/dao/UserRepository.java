package com.spike.dao;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.UserDTO;

public interface UserRepository extends JpaRepository<UserDTO, Integer> {

	@Query("select s from UserDTO s where s.loginId=?1")
	public Optional<UserDTO> findid(String id);

	@Query("select s from UserDTO s where s.loginId=?1 and s.status='ACTIVE'")
	public UserDTO loginCheck(String loginId);

	@Query("select s from UserDTO s where s.name=?1 and s.phone=?2")
	public UserDTO findUserid(String name, String phone);

	@Query("select s from UserDTO s where s.loginId=?1 and s.name=?2")
	public UserDTO findUserpwd(String loginId, String name);

	@Query("select s from UserDTO s where s.loginId=?1 and s.name=?2")
	public UserDTO findMember(String loginId, String name);

	@Modifying
	@Transactional
	@Query("update UserDTO s set s.password = ?1 where s.loginId = ?2 and s.name = ?3")
	public int changePwd(String password, String loginId, String name);

	@Modifying
	@Transactional
	@Query("update UserDTO s set s.name = ?1, s.email_id = ?2, s.email_domain = ?3, s.password = ?4 where s.loginId = ?5")
	public int profileEdit(String name, String email_id, String email_domain, String password, String loginId);

	@Modifying
	@Transactional
	@Query("update UserDTO s set s.name = ?1, s.email_id = ?2, s.email_domain = ?3, s.phone = ?4, s.phone01 = ?5, s.phone02 = ?6, s.phone03 = ?7, s.postcode = ?8, s.roadAddress = ?9, s.jibunAddress = ?10, s.detailAddress = ?11, s.References = ?12, s.password = ?13 where s.loginId = ?14")
	public void mypageEdit(String name, String email_id, String email_domain, String phone, String phone01,
			String phone02, String phone03, String postcode, String roadAddress, String jibunAddress,
			String detailAddress, String references, String password, String loginId);

	@Query("select s from UserDTO s where s.loginId=?1")
	Optional<UserDTO> findByLoginId(String loginId);

	@Query("select s from UserDTO s where s.loginId=?1")
	public UserDTO findFromSession(String loginId);

}
