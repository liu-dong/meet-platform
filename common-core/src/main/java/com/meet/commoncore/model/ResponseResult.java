package com.meet.commoncore.model;

import lombok.Data;

import java.util.Collection;

/**
 * @author LD
 * @date 2020/3/22 21:57
 */
public class ResponseResult {

    private int code = 200;
    private boolean success = true;
    private String message;
    private Object data;
    private int total;

    /**
     * 操作成功
     *
     * @param data
     * @param message
     * @return
     */
    public static ResponseResult success(Object data, String message) {
        ResponseResult result = new ResponseResult();
        result.setCode(200);
        result.setSuccess(true);
        result.setData(data);
        if (data instanceof Collection){
            result.setTotal(((Collection<?>) data).size());
        }
        result.setMessage(message);
        return result;
    }

    /**
     * 操作成功
     *
     * @param message
     * @return
     */
    public static ResponseResult success(String message) {
        ResponseResult result = new ResponseResult();
        result.setCode(200);
        result.setSuccess(true);
        result.setMessage(message);
        return result;
    }

    /**
     * 操作失败
     *
     * @param message
     * @return
     */
    public static ResponseResult error(String message) {
        ResponseResult result = new ResponseResult();
        result.setCode(500);
        result.setSuccess(false);
        result.setMessage(message);
        return result;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
