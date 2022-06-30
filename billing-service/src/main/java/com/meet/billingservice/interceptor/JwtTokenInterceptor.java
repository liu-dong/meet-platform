package com.meet.billingservice.interceptor;

import com.meet.commoncore.exception.GlobalException;
import com.meet.commoncore.model.UserDetails;
import com.meet.commoncore.util.CurrentUserUtils;
import com.meet.commoncore.util.JWTUtils;
import io.jsonwebtoken.Claims;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liudong 2022/6/29
 */
public class JwtTokenInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String tokenName = "JWT-TOKEN";
        // 尝试从header中取token
        String token = request.getHeader(tokenName);
        //尝试从参数中取token
        if (StringUtils.isEmpty(token)) {
            token = request.getParameter(tokenName);
        }
        //如果前端没有携带token返回json数据
        if (StringUtils.isEmpty(token)) {
            throw new GlobalException(401, "用户未登录");
        }
        //用于开发测试
        if ("JWT-TOKEN".equals(token)){
            return true;
        }
        //解析token
        boolean b = JWTUtils.checkToken(token);
        if (!b) {
            throw new GlobalException(401, "token无效");
        }
        //获取用户ID
        Claims claims = JWTUtils.getClaims(token);
        if (claims != null) {
            //将登录用户放到ThreadLocal变量变量中，方便业务获取当前登录用户
            UserDetails userDetails = new UserDetails();
            userDetails.setUserId(String.valueOf(claims.get("userId")));
            userDetails.setUsername(String.valueOf(claims.get("username")));
            userDetails.setRealName(String.valueOf(claims.get("realName")));
            //当前用户放到ThreadLocal变量变量中
            CurrentUserUtils.set(userDetails);
        }
        return true;
    }
}
