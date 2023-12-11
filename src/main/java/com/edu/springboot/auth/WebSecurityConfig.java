package com.edu.springboot.auth;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.web.client.RestTemplate;

@Configuration
public class WebSecurityConfig {
	
	/*스프링 시큐리티는 특정페이지에 로그인확인위한 코드 삽입하는게아닌, 아래처럼 요청명의 패턴 통해 설정한다.
	 * permitAll() : 인증없이 접근할수있는 페이지를 지정
	 * hasAnyRole() : 인증후 권한 획득해야 접근할수있는 페이지를 지정. 단 여러개중 하나만 획득하면 접근가능
	 * hasRole() : hasAnyRole() 과 비슷하지만 한가지의 구너한을 획득해야 접근가능
	 * 
	 * 정적리소스가 있는 css, js, images, guest 의 경우엔 권한없이 누구나접근가능
	 * member 하위는 USER 혹은 ADMIN 권한을 획득후 접근가능
	 * admin 하위는 ADMIN 권한만 접근가능
	 */
	//에러핸들러 등록위해 빈을 자동주입받는다. 주입받은 빈은 failureHandler()에 등록하면된다.
	@Autowired
	public MyAuthFailureHandler myAuthFailureHandler;
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf((csrf) -> csrf.disable()).cors((cors) -> cors.disable())
		.authorizeHttpRequests((request) -> request
				.dispatcherTypeMatchers(jakarta.servlet.DispatcherType.FORWARD).permitAll()
				.requestMatchers("/", "/css/**", "/js/**", "/images/**", "/rest/**", "/shop/**", "/shop", "/view/**", "/view", "/uploads/**", "/error").permitAll()
				.requestMatchers("/vartist", "/guest", "/guest/**").permitAll()
				.requestMatchers("/member/**").hasAnyRole("USER", "ARTIST", "ADMIN")
				.requestMatchers("/artist/**", "/artist").hasAnyRole("ARTIST", "ADMIN")
				.requestMatchers("/admin/**", "/admin").hasRole("ADMIN")
				/* .anyRequest().authenticated() */ //어떠한 요청이라도 인증필요
				); 
		
	/* 로그인페이지에대한 디자인 커스터마이징
	  * loginPage : 로그인페이지의 요청명
	    loginProcessingUrl : 폼값전송하여 로그인처리할 요청명
		failureUrl : 로그인실패한 경우 이동할요청명		
		failureHandler : 별도의 핸들러 인스턴스를 등록후 에러처리
		usernameParameter : 아이디입력위한 input의 name속성값
		passwordParameter : 패스워드의 name 속성값
		
		로그아웃페이지에대한 디자인 커스터마이징
		logoutUrl : 로그아웃 위한 요청명
		logoutSuccessUrl : 로그아웃후 이동할위치 		  */
		
		
		http.formLogin(formLogin -> formLogin
				.loginPage("/login") 		// default : /login
				.loginProcessingUrl("/loginAction")
//				.failureUrl("/error") 		// default : /login?error
				.failureHandler(myAuthFailureHandler)
				.usernameParameter("my_id") 	// default : username
				.passwordParameter("my_pass")	// default : password
				.permitAll() );
		http.logout(logout -> logout
				.logoutUrl("/logout")		// default : /logout
				.logoutSuccessUrl("/")
				.permitAll() );
		//권한이 부족한경우 이동할위치
		http.exceptionHandling(expHandling -> expHandling.accessDeniedPage("/denied"));
		return http.build();
	}
	
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery("select id, pass, enabled from member where id=?")
		.authoritiesByUsernameQuery("select id, authority from member where id=?")
		.passwordEncoder(new BCryptPasswordEncoder());
	}
	
//	@Bean
//    public PersistentTokenRepository tokenRepository(){
//        JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
//        jdbcTokenRepository.setDataSource(dataSource);
//        return jdbcTokenRepository;
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
}
