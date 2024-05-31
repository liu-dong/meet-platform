package com.dong.auth.web.service;

import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.service.AccountService;
import com.dong.user.service.UserService;
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
    UserService userService;

    @Override
    public UserDetail getUserDetail(HttpServletRequest request) {
        Claims claims = JWTUtils.getClaims(request);
        UserDetail userDetail = new UserDetail();
        if (claims != null) {
            String userId = String.valueOf(claims.get("userId"));
            userDetail = userService.getUserDetail(userId);
        }
        return userDetail;
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
