package com.dong.security.web.service;


import com.dong.security.web.model.LoginDTO;
import com.dong.security.web.model.RegisterDTO;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
import com.dong.user.entity.Account;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户管理
 *
 * @author liudong
 */
public interface UserService {


    Account getAccount(LoginDTO dto);

    String register(RegisterDTO dto);

    ResponseResult cancel(String username);

    UserDetail getUserDetail(HttpServletRequest request);

    UserDetail getUserDetail(LoginDTO dto);

    Account getAccountByUsername(String username);
}
