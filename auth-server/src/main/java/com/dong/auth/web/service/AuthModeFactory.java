package com.dong.auth.web.service;

import com.dong.auth.constant.AuthModeConstant;
import com.dong.auth.web.service.impl.JwtLoginServiceImpl;
import com.dong.auth.web.service.impl.SessionLoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * 登录模式工厂类
 *
 * @author liudong 2024/4/19
 */
public interface AuthModeFactory {

    LoginService createLoginService();
}

@Service
class AuthModeFactoryImpl implements AuthModeFactory {

    @Value("${auth.mode}")
    private String authMode;

    @Autowired
    private JwtLoginServiceImpl jwtLoginService;

    @Autowired
    private SessionLoginServiceImpl sessionLoginService;


    @Override
    public LoginService createLoginService() {
        switch (authMode) {
            case AuthModeConstant.JWT:
                return jwtLoginService;
            case AuthModeConstant.SESSION:
                return sessionLoginService;
            default:
                throw new IllegalArgumentException("Invalid login service type");
        }
    }
}
