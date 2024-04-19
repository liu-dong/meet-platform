package com.dong.auth.web.service.impl;

import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.entity.Account;
import com.dong.user.service.AccountService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * @author LD 2021/5/18
 */
@Service
public class JwtLoginServiceImpl extends AbstractLoginService {

    @Autowired
    AccountService accountService;

    @Override
    protected String createAuthentication(HttpServletRequest request, Account account) {
        // 生成token
        return JWTUtils.getToken(account.getId(), account.getUsername(), account.getRealName());

    }

    @Override
    protected void invalidAuthentication(HttpServletRequest request) {
        JWTUtils.refreshToken(request);
    }

    @Override
    public UserDetail getUserDetail(HttpServletRequest request) {
        Claims claims = JWTUtils.getClaims(request);
        UserDetail user = new UserDetail();
        if (claims != null) {
            user.setUserId(String.valueOf(claims.get("userId")));
            user.setUsername(String.valueOf(claims.get("username")));
            user.setRealName(String.valueOf(claims.get("realName")));
            // 查询账号角色
            List<Map<String, Object>> roles = accountService.findAccountRoleInfoList(user.getUserId());
            user.setRoles(roles);
            // 查询账号权限
            List<Map<String, Object>> permissions = accountService.findAccountPermissionList(user.getUserId());
            user.setPermissions(permissions);
        }
        return user;
    }

}
