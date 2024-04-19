package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.LoginService;
import com.dong.auth.web.service.UserService;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.entity.Account;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author LD 2021/5/18
 */
@Service
public class SessionLoginServiceImpl extends AbstractLoginService {

    @Value("${session.expiration.time}")
    private Integer expirationTime;

    @Autowired
    UserService userService;

    @Override
    protected String createAuthentication(HttpServletRequest request, Account account) {
        UserDetail userDetail = userService.getUserDetail(account);
        HttpSession session = request.getSession();
        //用户信息放入session
        session.setAttribute("userDetail", userDetail);
        //设置session过期时间，以秒为单位
        session.setMaxInactiveInterval(expirationTime);
        return userDetail.getUsername();
    }

    @Override
    protected void invalidAuthentication(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("userDetail");
    }

}
