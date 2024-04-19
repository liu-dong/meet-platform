package com.dong.auth.web.service.impl;

import com.dong.auth.web.model.LoginDTO;
import com.dong.auth.web.service.LoginService;
import com.dong.auth.web.service.UserService;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.entity.Account;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LD 2021/5/18
 */
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    UserService userService;

    @Override
    public String login(LoginDTO dto) {
        String token = "";
        if (StringUtils.isNotBlank(dto.getUsername()) && StringUtils.isNotBlank(dto.getPassword())) {
            Account account = userService.getAccountByUsername(dto.getUsername());
            if (account == null) {
                throw new GlobalException("无此用户");
            }
            if (!dto.getPassword().equals(account.getPassword())) {
                throw new GlobalException("密码错误");
            }
            //生成token
            token = JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());
        }
        return token;
    }

    @Override
    public String loginJwt(LoginDTO dto) {
        Account account = userService.getAccount(dto);
        //生成token
        return JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());
    }


    @Override
    public String logout() {
        return "退出登录成功!";
    }

}
