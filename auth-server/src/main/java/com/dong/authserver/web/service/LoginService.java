package com.dong.authserver.web.service;


import com.dong.authserver.web.model.LoginDTO;
import com.dong.authserver.web.model.UserDetail;
import com.dong.commoncore.model.ResponseResult;

import javax.servlet.http.HttpServletRequest;

/**
 * @author LD 2021/5/18
 */
public interface LoginService {

    String login(LoginDTO dto);

    ResponseResult logout(String username);

    ResponseResult cancel(String username);

    UserDetail getUserDetail(HttpServletRequest request);
}
