package com.edu.springboot.pay;

import java.net.URISyntaxException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;
import com.edu.springboot.restboard.ProductDTO;

@Service
@Transactional
public class KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";
	static final String cid = "TC0ONETIME"; // 가맹점 테스트 코드
    static final String admin_Key = "8cdd2bd111c004f2ce0e89acc8fe6f36"; // 공개 조심! 본인 애플리케이션의 어드민 키를 넣어주세요
    private KakaoReadyDTO kakaoReady;
    
    @Autowired
	IBoardService dao;
    
    public KakaoReadyDTO kakaoPayReady() {
    	
//    	String itemName = "", itemNo = "";
//		MemberDTO memberDTO = dao.mview(paymentDTO.getEmail());
//		String oidx = dao.orderNum(memberDTO.getMidx());
//		OrderDTO orderDTO = dao.oview(oidx);
//		List<Order2DTO> olist = dao.ordersview(oidx);
//		for(Order2DTO order2DTO : olist) {
//			ProductDTO productDTO = dao.pview(order2DTO.getPidx());
//			itemName += productDTO.getTitle() + ", ";
//			itemNo += productDTO.getPidx() + ", ";
//		}
//		
//		String order_id = memberDTO.getMidx() +" : "+ itemName.substring(0, itemName.length() - 2);
//		System.out.println("주문정보 : "+paymentDTO.getEmail()+" | "+order_id);
			
         // 카카오페이 요청 양식
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", cid);
        parameters.add("partner_order_id", "1001");
        parameters.add("partner_user_id", "Atelier");
        parameters.add("item_name", "작품");
        parameters.add("item_code", "100");
        parameters.add("quantity", "1");
        parameters.add("total_amount", "2100");
        parameters.add("tax_free_amount", "0");
        parameters.add("approval_url", "http://localhost:8586/pay/success"); // 성공 시 redirect url
        parameters.add("cancel_url", "http://localhost:8586/pay/cancel"); // 취소 시 redirect url
        parameters.add("fail_url", "http://localhost:8586/pay/fail"); // 실패 시 redirect url
        
        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
        
        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + admin_Key);
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

       try { kakaoReady = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/ready",
                requestEntity,
                KakaoReadyDTO.class);
        
        return kakaoReady;
       }catch (RestClientException e) {   e.printStackTrace();
       }  return kakaoReady;
    }
    
    /* 결제 완료 승인 */
    public KakaoApproveDTO approveResponse(String pgToken) {
    	
        // 카카오 요청
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", cid);
        parameters.add("tid", kakaoReady.getTid());
        parameters.add("partner_order_id", "test");
        parameters.add("partner_user_id", "Atelier");
        parameters.add("pg_token", pgToken);

        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
        
        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();
        
        KakaoApproveDTO approveResponse = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/approve",
                requestEntity,
                KakaoApproveDTO.class);
                
        return approveResponse;
    }
    
    /* 결제 환불  */
     public KakaoCancelDTO kakaoCancel() {
    	 
    	 KakaoApproveDTO kakaoapprove = new KakaoApproveDTO();
         // 카카오페이 요청
         MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
         parameters.add("cid", cid);
         parameters.add("tid", kakaoReady.getTid());
         parameters.add("cancel_amount", kakaoapprove.getAmount().toString());
         parameters.add("cancel_tax_free_amount", "0");

         // 파라미터, 헤더
         HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
     
         // 외부에 보낼 url
         RestTemplate restTemplate = new RestTemplate();
     
         KakaoCancelDTO cancelResponse = restTemplate.postForObject(
                 "https://kapi.kakao.com/v1/payment/cancel",
                 requestEntity,
                 KakaoCancelDTO.class);
                 
         return cancelResponse;
     }
    
    /*카카오 요구 헤더값 */
    private HttpHeaders getHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();

        String auth = "KakaoAK " + admin_Key;

        httpHeaders.set("Authorization", auth);
        httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        return httpHeaders;
    }
}
