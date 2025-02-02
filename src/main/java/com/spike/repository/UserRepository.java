package com.spike.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.spike.dto.AccountDTO;
import com.spike.dto.UserDTO;

public interface UserRepository extends JpaRepository<UserDTO, Long> {

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
	@Query("update UserDTO s set s.name = ?1, s.emailId = ?2, s.emailDomain = ?3, s.password = ?4 where s.loginId = ?5")
	public int profileEdit(String name, String EmailId, String EmailDomain, String password, String loginId);

	@Modifying
	@Transactional
	@Query("update UserDTO s set s.name = ?1, s.emailId = ?2, s.emailDomain = ?3, s.phone = ?4, s.phone01 = ?5, s.phone02 = ?6, s.phone03 = ?7, s.postcode = ?8, s.roadAddress = ?9, s.jibunAddress = ?10, s.detailAddress = ?11, s.References = ?12, s.password = ?13 where s.loginId = ?14")
	public void mypageEdit(String name, String EmailId, String EmailDomain, String phone, String phone01,
			String phone02, String phone03, String postcode, String roadAddress, String jibunAddress,
			String detailAddress, String references, String password, String loginId);

	@Query("select s from UserDTO s where s.loginId=?1")
	public Optional<UserDTO> findByLoginId(String loginId);

	@Query("select s from UserDTO s where s.loginId=?1")
	public UserDTO findFromSession(String loginId);

	@Modifying
	@Transactional
	@Query("delete from UserDTO s where s.loginId=?1")
	public void usersecession(String loginId);

	@Query("SELECT a FROM AccountDTO a WHERE a.owner.userId =?1")
	public List<AccountDTO> findByUserId(Long userId);

	@Query("SELECT a.account_number FROM AccountDTO a WHERE a.owner.userId =?1")
	public List<String> findbyaccountnumber(Long userId);

	// @Query("SELECT COUNT(a) FROM UserDTO a WHERE FUNCTION('DATE', a.UserId) =
	// CURRENT_DATE")
	// @Query("SELECT COUNT(u) FROM UserDTO u WHERE TRUNC(u.LastLogin) =
	// TRUNC(CURRENT_DATE)")
	@Query("SELECT COUNT(u) FROM UserDTO u WHERE (TRUNC(u.lastLogin) = TRUNC(CURRENT_DATE) OR u.lastLogin IS NULL)")
	public Long todayloge();

	@Query("select count(s) from UserDTO s where (trunc(s.registrationDate) = trunc(current_date))")
	public Long newMember();

	@Query("select s from UserDTO s where s.userId=?1")
	public List<UserDTO> findByUserIdEdit(Long UserId);

	@Modifying
	@Transactional
	@Query("update UserDTO s set s.isMinor=?1 , s.status=?2 where s.userId=?3")
	public void UpdateUser(String isMinor, String status, Long userId);

	@Modifying
	@Transactional
	@Query("delete from UserDTO s where s.userId=?1")
	public void UserDelete(Long UserId);

	@Modifying
	@Transactional'
	@Query("delete FROM AccountDTO a WHERE a.owner.userId =?1")
	public void AccountDelete(Long UserId);

}
