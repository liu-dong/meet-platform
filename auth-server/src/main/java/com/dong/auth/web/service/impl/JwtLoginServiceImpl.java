package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.LoginService;
import com.dong.auth.web.service.UserService;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.entity.Account;
import com.google.code.kaptcha.Constants;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author LD 2021/5/18
 */
@Service
public class JwtLoginServiceImpl extends AbstractLoginService {

    @Override
    protected String createAuthentication(HttpServletRequest request, Account account) {
        //生成token
        return JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());

    }

    @Override
    protected void invalidAuthentication(HttpServletRequest request) {
        JWTUtils.refreshToken(request);
    }

}
