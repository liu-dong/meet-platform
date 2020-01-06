package com.dong.meet.admin.vo;

/**
 * @author 3hld
 * @date 2020/1/6 15:46
 * @Version 1.0
 */
public class LoginInfoBean {

    private String username;
    private String password;
    private String captcha;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
