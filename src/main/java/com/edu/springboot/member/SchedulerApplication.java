package com.edu.springboot.member;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.OrderDTO;

@EnableScheduling
@SpringBootApplication
public class SchedulerApplication {
	
	@Autowired
	IBoardService dao;
	
	@Autowired
	Imember2Service daao;

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		SpringBootApplication.run
		SpringApplication.run(SchedulerApplication.class, args);
	}
	
	
	@Scheduled(cron = "0 0 0 * * ?") // 매일 자정에 실행
	public void scheduledFixe() throws InterruptedException{
		
//		Date currentDate = new Date();
//		int subtractDays = 1;
//		Calendar calendar = Calendar.getInstance();
//        calendar.setTime(currentDate);
//        calendar.add(Calendar.DAY_OF_MONTH, -subtractDays);
		LocalDate currentDate = LocalDate.now();
        LocalDate oneDayAgo = currentDate.minusDays(1);
		
		List<OrderDTO> olist11 = dao.olist11();
		for(OrderDTO od: olist11) {
			LocalDate orderDate = od.getOrderdate().toLocalDate();
			if(od.getPaymethod().equalsIgnoreCase("bank")  && orderDate.isBefore(oneDayAgo)) {
				
				daao.updateOrder1(od.getOidx(), "-1");
			}
		}
		System.out.println("호날두");
//		Thread.sleep(0);
	}

}
