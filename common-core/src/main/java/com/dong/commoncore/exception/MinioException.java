package com.dong.commoncore.exception;

import com.dong.commoncore.model.ResponseResult;

/**
 * 全局异常类
 *
 * @author liudong 2022/6/28
 */
public class MinioException extends Exception {

    private Integer code;

    public MinioException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public MinioException(String message) {
        super(message);
        this.code = 500;
    }

    public MinioException(ResponseResult result) {
        super(result.getMessage());
        this.code = result.getCode();
    }

    @Override
    public String toString() {
        return "MinioException{" + "code=" + code + ", message=" + this.getMessage() + '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
