package com.dong.commoncore.exception;

import com.dong.commoncore.model.ResponseResult;

/**
 * 用户账号异常类
 *
 * @author liudong 2022/6/28
 */
public class UserException extends RuntimeException {

    private Integer code;

    public UserException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public UserException(String message) {
        super(message);
        this.code = 500;
    }

    public UserException(ResponseResult result) {
        super(result.getMessage());
        this.code = result.getCode();
    }

    @Override
    public String toString() {
        return "UserException{" + "code=" + code + ", message=" + this.getMessage() + '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
