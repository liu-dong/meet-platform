package com.dong.auth.web.service;

import com.dong.commoncore.enums.LoginWayEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author liudong 2024/4/20
 */
public abstract class AbstractLoginWayFactory {

    public abstract LoginWayService createLoginWayService(LoginWayEnum loginWay);
}
@Service
class LoginWayFactory extends AbstractLoginWayFactory {

    @Autowired
    PhoneLoginWayServiceImpl phoneLoginWayService;
    @Autowired
    EmailLoginWayServiceImpl emailLoginWayService;
    @Autowired
    UsernameLoginWayServiceImpl usernameLoginWayService;


    @Override
    public LoginWayService createLoginWayService(LoginWayEnum loginWay) {
        switch (loginWay) {
            case ACCOUNT:
                return usernameLoginWayService;
            case PHONE:
                return phoneLoginWayService;
            case EMAIL:
                return emailLoginWayService;
            default:
                throw new IllegalArgumentException("无效的登录方式");
        }
    }
}
