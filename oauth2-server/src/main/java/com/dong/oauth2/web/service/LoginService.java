package com.dong.auth.web.service;


import com.dong.auth.web.model.LoginDTO;

/**
 * @author LD 2021/5/18
 */
public interface LoginService {

    String login(LoginDTO dto);

    String loginJwt(LoginDTO dto);

    String logout();
}
