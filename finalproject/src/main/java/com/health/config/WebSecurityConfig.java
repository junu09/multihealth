package com.health.config;

import java.util.Collections;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.SessionTrackingMode;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.health.filter.jwt.JwtAuthenticationFilter;
import com.health.service.MemberService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	MemberService userService;
	
	@Autowired
    public AuthenticationFailureHandler authenticationFailureHandler;

//	@Autowired
//	private OauthFilter filter;
	

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/resources/**", "/css/**", "/js/**").permitAll()// webapp/resources/... 각종 프론트리소스 접근허용		
			
			.antMatchers("/**", "/user/loginPage", "/user/signup", "/user/denied", "/user/logout/result").permitAll()
			.antMatchers("/user/admin/**", "/admin/**").access("hasAuthority('ADMIN')")			
			.antMatchers("/user/**").access("hasAuthority('USER')") // 페이지 권한 설정						
			.anyRequest().authenticated()//permitAll()
			.and()
			.addFilterBefore(jwtFilter(), UsernamePasswordAuthenticationFilter.class) // jwt 필터 설정
			
			
			.formLogin().loginPage("/user/loginPage")
			.loginProcessingUrl("/user/j_spring_security_check")			
			.failureHandler(authenticationFailureHandler)
			.usernameParameter("username")
            .passwordParameter("password")
			.defaultSuccessUrl("/")
			.permitAll() // 로그인 설정
			.and()
			
			
			.logout().logoutRequestMatcher(new AntPathRequestMatcher("/user/logout")) // 로그아웃 설정
			.logoutSuccessUrl("/user/loginPage").invalidateHttpSession(true) //user/logout/result
			.and()
			
			.exceptionHandling().accessDeniedPage("/user/denied") // 403 예외처리 핸들링
			.and()
			.csrf().disable();
	}

	
	
	@Bean
	public JwtAuthenticationFilter jwtFilter() {
		return new JwtAuthenticationFilter();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService).passwordEncoder(userService.passwordEncoder());
	}
	
//	@Bean
//	public Filter ssoFilter(){
//		return filter.ssoFilter();
//	}
	
	
	//j-sessionid 삭제
	@Bean
	public ServletContextInitializer clearJsession() {
		return new ServletContextInitializer() {
			@Override
			public void onStartup(ServletContext servletContext) throws ServletException {
				servletContext.setSessionTrackingModes(Collections.singleton(SessionTrackingMode.COOKIE));
				SessionCookieConfig sessionCookieConfig = servletContext.getSessionCookieConfig();
				sessionCookieConfig.setHttpOnly(true);
			}
		};	
	}
	
}