package com.dong.auth.web.service;

import com.dong.auth.constant.AuthModeConstant;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * @author liudong 2024/4/20
 */
@Service
public class UserDetailFactory {

    @Value("${auth.mode}")
    private String authMode;

    @Autowired
    JwtUserDetailService jwtUserDetailService;
    @Autowired
    SessionUserDetailService sessionUserDetailService;


    public UserDetailService createUserDetailService() {
        switch (authMode) {
            case AuthModeConstant.JWT:
                return jwtUserDetailService;
            case AuthModeConstant.SESSION:
                return sessionUserDetailService;
            default:
                throw new IllegalArgumentException("无效的认证模式类型");
        }
    }
}
