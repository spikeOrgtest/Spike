package com.spike.security;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spike.dto.AccountDTO;
import com.spike.dto.ManagerDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.AccountRepository;
import com.spike.repository.LoginHistoryRepository;
import com.spike.repository.UserRepository;
import com.spike.service.AccountService;

@Service
public class UserDetail implements org.springframework.security.core.userdetails.UserDetailsService {

	@Autowired
	private LoginHistoryRepository LoginHis;
	
    @Autowired
    private UserRepository userRepo;
    
    @Autowired
    private AccountService accountService;
    
    @Autowired //PR전 임시! 서비스로 돌릴 것
    private AccountRepository accRepo;

    private final PasswordEncoder passwordEncoder;
    
    public UserDetail(@Lazy PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional //PR전 임시 -> 서비스로 이동할 것
    @Override
    public UserDetails loadUserByUsername(String loginId) throws UsernameNotFoundException {
        // DB에서 login_id를 이용해 사용자 정보를 가져옵니다.
        UserDTO user = userRepo.findByLoginId(loginId)
                .orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다 : " + loginId));

        //일일 한도 초기화
        if(!user.getLastLogin().toLocalDate().isEqual(LocalDate.now().plusDays(1))) {
            //1.updateLimit로 처리
        	
        	this.accRepo.updateLimit(user);
        	//2.전체 계좌를 가져와서 세팅 후 save(기존 repository 메서드 재사용)
        	/*List<AccountDTO> accList = this.accRepo.findByOwner(user);
        	for(AccountDTO account : accList){
            	account.setAvailableLimit(account.getDayLimit());
            }
            this.accRepo.saveAll(accList);*/
            
        }
        
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
        // 유저의 역할에 맞는 권한 부여
        return Arrays.asList(new SimpleGrantedAuthority(user.getRoles()));
    }


    // 사용자가 입력한 비밀번호를 MD5로 암호화해서 DB 비밀번호와 비교하는 메서드 (로그인 시 비교)
    public boolean checkPassword(String inputPassword, String storedPassword) {
        return passwordEncoder.matches(inputPassword, storedPassword);
    }
    
    
}
