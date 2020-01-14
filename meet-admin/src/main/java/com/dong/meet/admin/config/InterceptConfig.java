package com.dong.meet.admin.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;

/**
 * AOP
 * 请求和响应拦截，在控制台输出请求的内容和响应的结果
 * @author 3hld
 * @date 2020/1/14 10:46
 * @Version 1.0
 */
@Aspect
@Component
public class InterceptConfig {

    @Pointcut("execution(public * com.dong.meet.admin.controller.*.*(..))")
    public void log(){

    }

    @Before("log()")
    public void beforeLog(JoinPoint joinPoint){
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        assert attributes != null;
        HttpServletRequest request = attributes.getRequest();
        System.out.println("----------------请求之前----------------");
        System.out.println("----------------1:" + request.getMethod() + "----------------");
        System.out.println("----------------2:" + request.getRemoteAddr() + "----------------");
        System.out.println("----------------3:" + request.getRemotePort() + "----------------");
//        System.out.println("----------------4:" + request.getHttpServletMapping() + "----------------");
        System.out.println("----------------5:" + request.getServletPath() + "----------------");
        System.out.println("----------------6:" + request.getContextPath() + "----------------");
        System.out.println("----------------7:" + Arrays.toString(joinPoint.getArgs()) + "----------------");
        System.out.println("----------------8:" + joinPoint.getSignature().getDeclaringTypeName() + "----------------");
        System.out.println("----------------9:" + joinPoint.getSignature().getDeclaringType() + "----------------");
    }

    @After("log()")
    public void afterLog(){
        System.out.println("----------------请求之后----------------");
    }
}
