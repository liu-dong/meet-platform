package com.dong.authserver.web.service;


import com.dong.authserver.web.model.LoginDTO;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import com.dong.securitycore.entity.Account;

import javax.servlet.http.HttpServletRequest;

/**
 * @author LD 2021/5/18
 */
public interface LoginService {

    String login(LoginDTO dto);

    String loginJwt(LoginDTO dto);

    Account getAccount(LoginDTO dto);

    ResponseResult logout(String username);

    ResponseResult cancel(String username);

    UserDetail getUserDetail(HttpServletRequest request);

    UserDetail getUserDetail(LoginDTO dto);
}
