package com.dong.commoncore.exception;

import com.dong.commoncore.model.ResponseResult;

/**
 * Token异常类
 *
 * @author liudong 2022/6/28
 */
public class TokenException extends RuntimeException {

    private Integer code;

    public TokenException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public TokenException(String message) {
        super(message);
        this.code = 401;
    }

    public TokenException(ResponseResult result) {
        super(result.getMessage());
        this.code = result.getCode();
    }

    @Override
    public String toString() {
        return "TokenException{" + "code=" + code + ", message=" + this.getMessage() + '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
