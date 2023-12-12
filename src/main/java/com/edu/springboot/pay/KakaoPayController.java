package com.edu.springboot.pay;

import java.security.Principal;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/pay")
@AllArgsConstructor
public class KakaoPayController {
	
	private final KakaoPayService kakaoPayService;
	
    /* 결제요청*/
    @PostMapping("/ready")
    public KakaoReadyDTO readyToKakaoPay() {
        return kakaoPayService.kakaoPayReady();
    }
    
    /* 결제 성공 */
    @GetMapping("/success")
    public ResponseEntity afterPayRequest(@RequestParam("pg_token") String pgToken) {
    	KakaoApproveDTO kakaoApprove = kakaoPayService.approveResponse(pgToken);
    		return new ResponseEntity<>(kakaoApprove, HttpStatus.OK);
    }

    /*결제 진행 중 취소*/
    @GetMapping("/cancel")
    public void cancel() {
    	
        throw new BusinessLogicException(ExceptionCode.PAY_CANCEL);
    }

    /* 결제 실패 */
    @GetMapping("/fail")
    public void fail() {

        throw new BusinessLogicException(ExceptionCode.PAY_FAILED);
    }
    
    /* 환불  */
    @PostMapping("/refund")
    public ResponseEntity refund() {

        KakaoCancelDTO kakaoCancelDTO = kakaoPayService.kakaoCancel();

        return new ResponseEntity<>(kakaoCancelDTO, HttpStatus.OK);
    }
}
