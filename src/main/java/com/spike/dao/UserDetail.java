package com.spike.dao;

import java.util.Arrays;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.spike.dto.UserDTO;

import spikepwd.PwdChange;

@Service
public class UserDetail implements UserDetailsService {

	@Autowired
	private UserRepository userRepo;
	
	@Override
	public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException {
		// DB에서 login_id를 이용해 사용자 정보를 가져옵니다.
		UserDTO user = userRepo.findByLoginId(loginId)
		.orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다 : " + loginId));
		
		System.out.println("User Load Detail");
		// UserDTO 엔티티를 UserDetails로 변환하여 반환
		return new User(user.getLoginId(),
				user.getPassword(), getAuthority(user));
	}
	
	// 권한을 설정하는 메서드
	private Collection<? extends GrantedAuthority> getAuthority(UserDTO user) {
		System.out.println("User Load Detail");
		return Arrays.asList(new SimpleGrantedAuthority("ROLE_USER"));
	}
	
    // 사용자가 입력한 비밀번호를 MD5로 암호화해서 DB 비밀번호와 비교하는 메서드 (로그인 시 비교)
    public boolean checkPassword(String inputPassword, String storedPassword) {
    	System.out.println("User Load Detail");
        String encryptedInputPassword = PwdChange.getPassWordToXEMD5String(inputPassword);
        System.out.println("입력된 비밀번호 (암호화): " + encryptedInputPassword);
        System.out.println("저장된 비밀번호: " + storedPassword);
        return encryptedInputPassword.equals(storedPassword);
    }

}
