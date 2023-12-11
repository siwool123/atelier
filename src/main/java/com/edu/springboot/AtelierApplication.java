package com.edu.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
<<<<<<< HEAD

@SpringBootApplication
public class AtelierApplication {

	public static void main(String[] args) {
		SpringApplication.run(AtelierApplication.class, args);
=======
import org.springframework.security.crypto.factory.PasswordEncoderFactories;

@SpringBootApplication
public class AtelierApplication {

	public static void main(String[] args) {
		SpringApplication.run(AtelierApplication.class, args);
		
		//시큐리티에서 인증에 사용한느 암호화된 패스워드는 아래메서드로 만들수있다. 실행할때마다 인코딩의 변경이 있어 보안강화된다.
//		String passwd = PasswordEncoderFactories.createDelegatingPasswordEncoder().encode("123456");
//		System.out.println(passwd);
>>>>>>> refs/remotes/origin/main
	}

}
