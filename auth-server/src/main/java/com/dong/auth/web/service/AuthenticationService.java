package com.dong.auth.web.service;

import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.JWTUtils;
import com.dong.user.service.UserService;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author liudong 2024/4/20
 */
public interface AuthenticationService {

    /**
     * 创建认证
     *
     * @param request
     * @param userId
     * @return
     */
    String createAuthentication(HttpServletRequest request, String userId);

    /**
     * 使认证失效
     *
     * @param request
     */
    void invalidAuthentication(HttpServletRequest request);

}

@Service
class JwtAuthenticationService implements AuthenticationService {

    @Autowired
    UserService userService;

    @Override
    public String createAuthentication(HttpServletRequest request, String userId) {
        UserDetail userDetail = userService.getUserDetail(userId);
        // 生成token
        return JWTUtils.getToken(userDetail);
    }

    @Override
    public void invalidAuthentication(HttpServletRequest request) {
        JWTUtils.refreshToken(request);
    }

}
@Service
class SessionAuthenticationService implements AuthenticationService {

    @Value("${session.expiration.time}")
    private Integer expirationTime;

    @Autowired
    UserService userService;

    @Override
    public String createAuthentication(HttpServletRequest request, String userId) {
        UserDetail userDetail = userService.getUserDetail(userId);
        HttpSession session = request.getSession();
        //用户信息放入session
        session.setAttribute("userDetail", userDetail);
        //设置session过期时间，以秒为单位
        session.setMaxInactiveInterval(expirationTime);
        return userDetail.getUsername();
    }

    @Override
    public void invalidAuthentication(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("userDetail");
    }
}
