package com.dong.auth.web.service;

import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.service.AccountService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author liudong 2024/4/20
 */
public interface UserDetailService {


    /**
     * 获取用户信息
     *
     * @param request
     * @return
     */
    UserDetail getUserDetail(HttpServletRequest request);
}


@Service
class JwtUserDetailService implements UserDetailService {

    @Autowired
    AccountService accountService;

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

@Service
class SessionUserDetailService implements UserDetailService {

    @Override
    public UserDetail getUserDetail(HttpServletRequest request) {
        HttpSession session = request.getSession();
        // 用户信息放入session
        return (UserDetail) session.getAttribute("userDetail");
    }
}
