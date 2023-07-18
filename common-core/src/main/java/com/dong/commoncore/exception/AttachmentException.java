package com.dong.commoncore.exception;

import com.dong.commoncore.model.ResponseResult;

/**
 * @author liudong
 * @date 2023/7/18
 */
public class AttachmentException extends RuntimeException {

    private Integer code;

    public AttachmentException(Integer code, String message) {
        super(message);
        this.code = code;
    }

    public AttachmentException(String message) {
        super(message);
        this.code = 500;
    }

    public AttachmentException(ResponseResult result) {
        super(result.getMessage());
        this.code = result.getCode();
    }

    @Override
    public String toString() {
        return "AttachmentException{" + "code=" + code + ", message=" + this.getMessage() + '}';
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
