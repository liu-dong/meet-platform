package com.dong.auth.config.interceptor;

import com.dong.auth.constant.AuthModeConstant;
import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.CurrentUserUtils;
import com.dong.commoncore.util.JWTUtils;
import com.dong.commoncore.util.ObjectUtils;
import io.jsonwebtoken.Claims;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 认证拦截器
 *
 * @author liudong
 */
public class AuthenticationInterceptor implements HandlerInterceptor {

    /**
     * 认证模式
     */
    @Value("${auth.mode}")
    private String authMode;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if (AuthModeConstant.SESSION.equals(authMode)) {
            System.out.println("session认证");
            return sessionAuth(request);
        } else {
            System.out.println("jwt认证");
            return jwtAuth(request);
        }
    }

    /**
     * session认证
     *
     * @param request
     * @return
     */
    private static boolean sessionAuth(HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");

        if (userDetail == null) {
            throw new GlobalException(401, "用户未登录");
        }
        CurrentUserUtils.set(userDetail);
        return true;
    }

    /**
     * jwt token认证
     *
     * @param request
     * @return
     */
    private static boolean jwtAuth(HttpServletRequest request) {
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
        if ("JWT-TOKEN".equals(token)) {
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
            UserDetail userDetail = JWTUtils.convertUserDetail(claims);
            //当前用户放到ThreadLocal变量变量中
            CurrentUserUtils.set(userDetail);
            return true;
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
