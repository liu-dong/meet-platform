package com.meet.commoncore.exception;

import com.meet.commoncore.model.ResponseResult;

/**
 * 全局异常类
 *
 * @author liudong 2022/6/28
 */
public class GlobalException extends RuntimeException {

    private Integer code;

    public GlobalException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public GlobalException(ResponseResult result) {
        super(result.getMessage());
        this.code = result.getCode();
    }

    @Override
    public String toString() {
        return "GlobalException{" + "code=" + code + ", message=" + this.getMessage() + '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
