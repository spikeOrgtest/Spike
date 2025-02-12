package com.spike.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.ForwardAuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private AuthenticateLoginpoint authenticationEntryPoint;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
    @Bean
    public AuthenticationFailureHandler failureHandler(){
        return new ForwardAuthenticationFailureHandler("/spike.com/login");
    }
    
    public SecurityConfig(AuthenticateLoginpoint authenticationEntryPoint) {
    	this.authenticationEntryPoint = authenticationEntryPoint;
    }

    @Autowired
    private UserDetail userDetail;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                // 인증이 필요한 페이지만 지정
                .antMatchers("/spike.com/mypage/*").hasRole("USER")  // 일반 권한 사용자만 접근 가능
                .antMatchers("/spike.com/admin/*").hasRole("ADMIN")  // 관리자 권한 사용자만 접근 가능
                // 그 외의 모든 페이지는 인증 없이 접근 가능
                .anyRequest().permitAll()
            .and()
            .formLogin()
                .loginPage("/spike.com/login")  
                .loginProcessingUrl("/spike.com/login")  
                .failureHandler(failureHandler()) 
                .defaultSuccessUrl("/spike.com/", true)  
                .usernameParameter("loginId")  
                .passwordParameter("password")  
                .permitAll()
            .and()
            .logout()
                .logoutUrl("/logout")  
                .logoutSuccessUrl("/")  
                .permitAll()
            .and()
            .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)  
                .invalidSessionUrl("/spike.com")
            .and()
                .exceptionHandling()
                .authenticationEntryPoint(authenticationEntryPoint)
                .accessDeniedPage("/spike.com/access-denied");  // 권한 거부 시 보여줄 페이지 설정
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetail);
    }
}
