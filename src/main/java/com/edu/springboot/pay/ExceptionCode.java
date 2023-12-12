package com.edu.springboot.pay;

import lombok.Getter;

public enum ExceptionCode {

	PAY_CANCEL("PAY_CANCEL", "결제 중 취소"),
    PAY_FAILED("PAY_FAILED", "결제 실패");

    @Getter
    private final String code;

    @Getter
    private final String message;

    ExceptionCode(String code, String message) {
    	this.code = code;
        this.message = message;
    }
}
