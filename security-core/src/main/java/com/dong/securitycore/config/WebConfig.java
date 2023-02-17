package com.dong.securitycore.config;

import com.dong.securitycore.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;
import java.util.List;

/**
 * @author liudong 2022/6/29
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Value("${exclude.path}")
    private String excludePath;

    /**
     * 不拦截的路径
     */
    private static List<String> excludePathPatterns = Arrays.asList("/test/**", "/login", "/getKaptcha", "/checkToken", "/logout", "/favicon.ico", "/error");

    /**
     * swagger路径
     */
    private static final String[] swaggerPath = {"/csrf", "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html", "/swagger-ui.html/**"};

    @Bean
    public HandlerInterceptor authenticationInterceptor() {
        return new AuthenticationInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(swaggerPath)
                .excludePathPatterns(excludePathPatterns)
                .excludePathPatterns(excludePath.split(","));
    }
}
