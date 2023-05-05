package com.dong.demo.common;

/**
 * @author liudong
 * @date 2023/4/26
 */
public class BaseException extends Throwable {

    private Integer code;
    private String message;

    public BaseException(IResponseEnum responseEnum, Object[] args, String message) {
    }

    public BaseException(IResponseEnum responseEnum, Object[] args, String message, Throwable cause) {
    }
}
