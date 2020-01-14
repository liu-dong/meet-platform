package com.dong.meet.common.http;

/**
 * HTTP返回结果封装
 *
 * @author LD
 */
public class HttpResult {
    private int code = 200;
    private String message;
    private Object data;

    /**
     * 默认错误提示
     *
     * @return
     */
    public static HttpResult error() {
        return error(HttpStatus.SC_INTERNAL_SERVER_ERROR, "未知异常，请联系管理员");
    }

    /**
     * 自定义错误提示
     *
     * @param message
     * @return
     */
    public static HttpResult error(String message) {
        return error(HttpStatus.SC_INTERNAL_SERVER_ERROR, message);
    }

    /**
     * 返回错误码和提示信息
     *
     * @param message
     * @return
     */
    public static HttpResult error(int code, String message) {
        HttpResult result = new HttpResult();
        result.setCode(code);
        result.setMessage(message);
        return result;
    }

    /**
     * 成功后返回提示信息
     *
     * @param message
     * @return
     */
    public static HttpResult ok(String message) {
        HttpResult result = new HttpResult();
        result.setMessage(message);
        return result;
    }

    /**
     * 成功后返回数据
     *
     * @param data
     * @return
     */
    public static HttpResult ok(Object data) {
        HttpResult result = new HttpResult();
        result.setData(data);
        return result;
    }

    /**
     * 成功后返回数据和提示信息
     *
     * @param data
     * @param message
     * @return
     */
    public static HttpResult ok(Object data, String message) {
        HttpResult result = new HttpResult();
        result.setData(data);
        result.setMessage(message);
        return result;
    }

    public static HttpResult ok() {
        return new HttpResult();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
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
}
