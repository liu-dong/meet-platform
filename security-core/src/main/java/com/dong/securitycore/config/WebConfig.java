package com.dong.securitycore.config;

import com.dong.securitycore.interceptor.JwtTokenInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author liudong 2022/6/29
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    /**
     * 不拦截的路径
     */
    private static String[] excludePathPatterns = {"/test/**", "/login", "/getKaptcha", "/checkToken", "/logout", "/favicon.ico", "/error"};

    /**
     * swagger路径
     */
    private static final String[] swaggerPath = {"/csrf", "/swagger-resources/**", "/webjars/**", "/v2/**", "/swagger-ui.html", "/swagger-ui.html/**"};

    @Bean
    public JwtTokenInterceptor jwtTokenInterceptor() {
        return new JwtTokenInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(jwtTokenInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(swaggerPath)
                .excludePathPatterns(excludePathPatterns);
    }
}
