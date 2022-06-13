package com.meet.authserver.web.service;


import com.meet.commoncore.model.ResponseResult;

/**
 * @author LD 2021/5/18
 */
public interface LoginService {

    ResponseResult logout(String username);

    ResponseResult cancel(String username);
}
