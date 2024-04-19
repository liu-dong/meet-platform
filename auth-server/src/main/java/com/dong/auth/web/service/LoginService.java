package com.dong.auth.web.service;


import com.dong.auth.web.model.LoginDTO;

import javax.servlet.http.HttpServletRequest;

/**
 * @author LD 2021/5/18
 */
public interface LoginService {

    String login(HttpServletRequest request, LoginDTO dto);

    void logout(HttpServletRequest request);
}
