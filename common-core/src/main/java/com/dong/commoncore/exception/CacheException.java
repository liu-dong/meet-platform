package com.dong.commoncore.exception;

/**
 * 缓存异常
 *
 * @author liudong
 * @date 2023/6/5
 */
public class CacheException extends RuntimeException {
    private Integer code = 500;

    public CacheException() {
    }

    public CacheException(String message) {
        super(message);
    }

    public Integer getCode() {
        return this.code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
