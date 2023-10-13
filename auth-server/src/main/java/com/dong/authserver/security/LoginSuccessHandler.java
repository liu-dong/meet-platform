package com.dong.authserver.security;

import com.alibaba.fastjson.JSON;
import com.dong.commoncore.enums.LoginTypeEnum;
import com.dong.commoncore.model.ResponseResult;
import com.dong.commoncore.util.AddressUtils;
import com.dong.logserver.web.model.dto.LoginLogsDTO;
import com.dong.logserver.web.service.LoginLogsService;
import com.dong.securitycore.dao.AccountJpaDao;
import com.dong.securitycore.entity.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.util.StringUtils;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

/**
 * @author LD 2021/5/27
 */
@Configuration
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    AccountJpaDao accountJpaDao;
    @Autowired
    LoginLogsService loginLogsService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authentication) throws IOException, ServletException {
        AuthenticationSuccessHandler.super.onAuthenticationSuccess(request, response, chain, authentication);
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Account account = accountJpaDao.getAccountByUsername(authentication.getName());
        // 修改登录时间
        String lastLoginTime = updateLastLoginTime(account);
        //保存登录日志
        saveLoginLogs(request, authentication);
        HashMap<String, Object> userInfo = new HashMap<>();
        userInfo.put("username", account.getUsername());
        userInfo.put("realName", account.getRealName());
        userInfo.put("lastLoginTime", lastLoginTime);

        HashMap<String, Object> dataMap = new HashMap<>();
        dataMap.put("userInfo", userInfo);
        dataMap.put("roleInfo", authentication.getAuthorities());
        ResponseResult result = ResponseResult.success(dataMap, "登录成功！");
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

    private String updateLastLoginTime(Account account) {
        String lastLoginTime = "第一次登录";
        if (!StringUtils.isEmpty(account.getLastLoginTime())) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
            lastLoginTime = sdf.format(account.getLastLoginTime());
        }
        account.setLastLoginTime(new Date());
        account.setLoginCount(account.getLoginCount() + 1);
        accountJpaDao.save(account);
        return lastLoginTime;
    }
}
