package com.spike.security;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spike.dto.ManagerDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.LoginHistoryRepository;
import com.spike.repository.UserRepository;

@Service
public class UserDetail implements org.springframework.security.core.userdetails.UserDetailsService {

	@Autowired
	private LoginHistoryRepository LoginHis;
	
    @Autowired
    private UserRepository userRepo;

    private final PasswordEncoder passwordEncoder;
    
    public UserDetail(@Lazy PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException {
        // DB에서 login_id를 이용해 사용자 정보를 가져옵니다.
        UserDTO user = userRepo.findByLoginId(loginId)
                .orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다 : " + loginId));

        // 사용자 정보 저장 (로그인 시 마다)
        user.setLastLogin(LocalDateTime.now());
        userRepo.save(user);  // DB에 저장
        
        ManagerDTO Llist = new ManagerDTO();
        Llist.setLogHis(user);
        Llist.setAllTime(user.getLastLogin());
        LoginHis.save(Llist);

        // SpikeUser 객체를 반환
        return new SpikeUser(user, user.getLoginId(), user.getPassword(), getAuthority(user));
    }

    // 권한을 설정하는 메서드
    private Collection<? extends GrantedAuthority> getAuthority(UserDTO user) {
        return Arrays.asList(new org.springframework.security.core.authority.SimpleGrantedAuthority("ROLE_USER"));
    }

    // 사용자가 입력한 비밀번호를 MD5로 암호화해서 DB 비밀번호와 비교하는 메서드 (로그인 시 비교)
    public boolean checkPassword(String inputPassword, String storedPassword) {
        return passwordEncoder.matches(inputPassword, storedPassword);
    }
    
    
}
