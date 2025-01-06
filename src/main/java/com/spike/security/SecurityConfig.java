package com.spike.security;  

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration  // 이 클래스를 설정 클래스로 인식하게 하는 애너테이션
@EnableWebSecurity  // Spring Security를 활성화하는 애너테이션
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/signup", "/login", "/resources/**").permitAll()  // 로그인, 회원가입 페이지 등 허용
                .anyRequest().authenticated()  // 그 외의 경로는 인증이 필요함
            .and()
                .formLogin()
                .loginPage("/login")  // 커스텀 로그인 페이지 설정
                .loginProcessingUrl("/login")  // 로그인 처리 경로 설정
                .permitAll()  // 로그인 페이지는 누구나 접근할 수 있도록 허용
            .and()
                .logout()
                .permitAll();  // 로그아웃 페이지는 누구나 접근할 수 있도록 허용
    }
}
