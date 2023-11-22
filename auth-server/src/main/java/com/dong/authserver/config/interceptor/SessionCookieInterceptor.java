package com.dong.authserver.config.interceptor;

import com.dong.commoncore.exception.GlobalException;
import com.dong.commoncore.model.UserDetail;
import com.dong.commoncore.util.CurrentUserUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author liudong 2023/2/17
 */
public class SessionCookieInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        sessionAuth(request);
        return true;
    }

    private static void sessionAuth(HttpServletRequest request) {
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");

        if (userDetail == null) {
            throw new GlobalException(401, "用户未登录");
        }
        CurrentUserUtils.set(userDetail);
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
