package com.dong.auth.config;

import com.dong.auth.config.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * 应用安全配置
 *
 * @author liudong
 */
@EnableWebMvc
public class WebSecurityConfigurer implements WebMvcConfigurer {

    /**
     * 不拦截的路径
     */
    private static final String[] excludePathPatterns = {"/authenticate", "/test/**", "/register", "/login", "/getKaptcha", "/updatePassword", "/session/**", "/checkToken", "/logout", "/favicon.ico", "/error"};

    /**
     * swagger路径
     */
    private static final String[] swaggerPath = {"/csrf", "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html", "/swagger-ui.html/**"};

    @Value("${exclude.path}")
    private String excludePath;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthenticationInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(swaggerPath)
                .excludePathPatterns(excludePathPatterns)
                .excludePathPatterns(excludePath.split(","));
    }
}
