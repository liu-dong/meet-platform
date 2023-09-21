package com.dong.commoncore.exception;

/**
 * websocket异常
 *
 * @author liudong
 * @date 2023/6/5
 */
public class WebSocketException extends RuntimeException {
    private Integer code = 500;

    public WebSocketException() {
    }

    public WebSocketException(String message) {
        super(message);
    }

    public Integer getCode() {
        return this.code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
