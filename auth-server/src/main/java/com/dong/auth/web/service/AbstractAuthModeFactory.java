package com.dong.auth.web.service;

import com.dong.auth.constant.AuthModeConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * 登录模式工厂类
 *
 * @author liudong 2024/4/19
 */
public abstract class AbstractAuthModeFactory {

    public abstract AuthModeService createAuthModeService();
}

@Service
class AuthModeFactory extends AbstractAuthModeFactory {

    @Value("${auth.mode}")
    private String authMode;

    @Autowired
    private JwtAuthModeService jwtAuthModeService;

    @Autowired
    private SessionAuthModeService sessionAuthModeService;


    @Override
    public AuthModeService createAuthModeService() {
        switch (authMode) {
            case AuthModeConstant.JWT:
                return jwtAuthModeService;
            case AuthModeConstant.SESSION:
                return sessionAuthModeService;
            default:
                throw new IllegalArgumentException("无效的认证模式类型");
        }
    }
}
