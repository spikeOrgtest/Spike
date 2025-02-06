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

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
    @Bean
    public AuthenticationFailureHandler failureHandler(){
        return new ForwardAuthenticationFailureHandler("/spike.com/login");
    }

    @Autowired
    private UserDetail userDetail;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                // 인증이 필요한 페이지만 지정
                .antMatchers("/profile", "/dashboard", "/admin", "/spike.com/mypage/main").authenticated()  
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
                .invalidSessionUrl("/spike.com");  
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetail);
    }
}
