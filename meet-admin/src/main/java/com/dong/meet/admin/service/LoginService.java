package com.dong.meet.admin.service;

import com.dong.meet.admin.vo.LoginInfoBean;
import com.dong.meet.common.http.HttpResult;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 3hld
 * @date 2020/1/14 17:06
 * @Version 1.0
 */
public interface LoginService {

    /**
     * 登录方法
     *
     * @param bean
     * @param request
     * @return
     */
    HttpResult login(LoginInfoBean bean, HttpServletRequest request);
}
