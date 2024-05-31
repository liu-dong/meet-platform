package com.dong.sso.config;

import com.alibaba.fastjson.JSON;
import com.dong.commoncore.enums.LoginWayEnum;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.model.UserDetail;
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
import java.util.Map;

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
        UserDetail userDetail = accountService.getAccountByUsername(authentication.getName());
        // 修改登录时间
        String lastLoginTime = accountService.updateLastLoginTime(userDetail.getAccountId());
        // 保存登录日志
        saveLoginLogs(request, authentication);
        HashMap<String, Object> userInfo = new HashMap<>();
        userInfo.put("username", userDetail.getUsername());
        userInfo.put("realName", userDetail.getRealName());
        userInfo.put("lastLoginTime", lastLoginTime);

        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("userInfo", userInfo);
        dataMap.put("roleInfo", authentication.getAuthorities());
        String token = JWTUtils.getToken(userDetail.getUserId(), userDetail.getUsername(), userDetail.getRealName());
        ResponseResult<String> result = ResponseResult.success(token, "登录成功！");
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.write(JSON.toJSONString(result));

    }

    private void saveLoginLogs(HttpServletRequest request, Authentication authentication) {
        LoginLogsDTO dto = new LoginLogsDTO();
        dto.setAccount(authentication.getName());
        dto.setLoginIp(AddressUtils.getIP(request));
        dto.setLoginAddress("广州市越秀区");
        dto.setLoginType(LoginWayEnum.ACCOUNT.getCode());
        dto.setRemark("登录成功");
        loginLogsService.saveLoginLogs(dto);
    }
}
