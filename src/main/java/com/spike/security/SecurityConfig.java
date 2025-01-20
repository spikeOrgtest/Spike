package com.spike.security;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.spike.dao.UserDetail;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private UserDetail userDetail;
	
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
            	// 인증이 필요한 페이지만 지정
            	.antMatchers("/profile", "/dashboard", "/admin", "/spike.com/mypage/main").authenticated()  // 인증된 사용자만 접근할 수 있는 경로
            
            	// 그 외의 모든 페이지는 인증 없이 접근 가능
            	.anyRequest().permitAll()  // 인증 없이 모든 경로에 접근 가능
            .and()
            .formLogin()
                .loginPage("/spike.com/login")  // 로그인 페이지 URL 설정
                .loginProcessingUrl("/spike.com/login")  // 로그인 요청을 처리할 URL
                .failureUrl("/login?error")  // 로그인 실패 시 리디렉션할 URL 설정
                .defaultSuccessUrl("/", true)  // 로그인 성공 후 이동할 URL
                .permitAll()  // 로그인 페이지 접근은 모두 허용
                .failureHandler(authenticationFailureHandler())
            .and()
            .logout()
                .logoutUrl("/logout")  // 로그아웃 URL
                .logoutSuccessUrl("/")  // 로그아웃 후 리디렉션할 URL
                .permitAll();  // 로그아웃 페이지도 모두 허용
        
        
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	
    	System.out.println("User Load security");
    	auth.userDetailsService(userDetail);
    	
    }
    
    private AuthenticationFailureHandler authenticationFailureHandler() {
        return (request, response, exception) -> {
            System.out.println("로그인 실패: " + exception.getMessage());
            response.sendRedirect("/login?error");  // 로그인 실패 시 리디렉션
        };
    }
}
