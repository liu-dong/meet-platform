package com.dong.security.config;

import com.alibaba.fastjson.JSON;
import com.dong.commoncore.enums.LoginTypeEnum;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.AddressUtils;
import com.dong.commoncore.util.JWTUtils;
import com.dong.log.web.model.dto.LoginLogsDTO;
import com.dong.log.web.service.LoginLogsService;
import com.dong.user.entity.Account;
import com.dong.user.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

/**
 * 登录成功回调
 *
 * @author LD 2021/5/27
 */
@Configuration
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    AccountService accountService;
    @Autowired
    LoginLogsService loginLogsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        AuthenticationSuccessHandler.super.onAuthenticationSuccess(request, response, chain, authentication);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Account account = accountService.getAccountByUsername(authentication.getName());
        // 修改登录时间
        String lastLoginTime = accountService.updateLastLoginTime(account);
        //保存登录日志
        saveLoginLogs(request, authentication);
        HashMap<String, Object> userInfo = new HashMap<>();
        userInfo.put("username", account.getUsername());
        userInfo.put("realName", account.getRealName());
        userInfo.put("lastLoginTime", lastLoginTime);

        HashMap<String, Object> dataMap = new HashMap<>();
        dataMap.put("userInfo", userInfo);
        dataMap.put("roleInfo", authentication.getAuthorities());
        String token = JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());
        ResponseResult result = ResponseResult.success(token, "登录成功！");
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.write(JSON.toJSONString(result));

    }

    private void saveLoginLogs(HttpServletRequest request, Authentication authentication) {
        LoginLogsDTO dto = new LoginLogsDTO();
        dto.setAccount(authentication.getName());
        dto.setLoginIp(AddressUtils.getIP(request));
        dto.setLoginAddress("广州市越秀区");
        dto.setLoginType(LoginTypeEnum.ACCOUNT.getCode());
        dto.setRemark("登录成功");
        loginLogsService.saveLoginLogs(dto);
    }
}
