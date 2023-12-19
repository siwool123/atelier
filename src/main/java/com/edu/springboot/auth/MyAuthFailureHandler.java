package com.edu.springboot.auth;

import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//자동생성되는 빈임을 명시하는 어노테이션부착
@Configuration
public class MyAuthFailureHandler implements AuthenticationFailureHandler {
	//핸들러 구현위해 AuthenticationFailureHandler 인터페이스 구현하여 클래스정의
	/* 시큐리티 환경에서 로그인시 인증오류 발생하는 여러케이스를 처리하기위해 오버라이딩한 메서드 */
	public void onAuthenticationFailure (HttpServletRequest req, HttpServletResponse resp, AuthenticationException exception) 
			throws IOException, ServletException {
		String errorMsg = "";
		
		/* instanceof 연산자 이용해서 전달된 예외객체의 종류를 파악후 적절한 에러메시지를 지정한다. 단, 인증관련메세지는 너무자세히기술하진않는다. */
		if(exception instanceof BadCredentialsException) {
			loginFailureCnt(req.getParameter("my_id"));
			errorMsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요. (1)";
			
		}else if (exception instanceof InternalAuthenticationServiceException) {
			loginFailureCnt(req.getParameter("my_id"));
			errorMsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요. (2)";
			
		}else if (exception instanceof DisabledException) {
			errorMsg = "계정이 비활성화되었습니다. 관리자에게 문의하세요. (3)";
			
		}else if (exception instanceof CredentialsExpiredException) {
			errorMsg = "비밀번호 유효기간이 만료되었습니다. 관리자에게 문의하세요. (4)";
		}
		//에러메세지를 req영역에 저장 > 로그인 페이지로 포워드. 이때 파라미터 error 를 전달한다.
		req.setAttribute("errorMsg", errorMsg);
		req.getRequestDispatcher("/login?error").forward(req, resp);
	}
	
	//예외 종류에따라 아래처럼 계정 잠그는 기능등을 업무에맞게 제작가능
	public void loginFailureCnt(String username) {
		System.out.println("요청아이디 : "+username);
		/* 틀린횟수 없데이트. 틀린횟수 조회. 만약 3회 이상 실패하면 계정잠금처리 */
	}
}
