package com.meet.billingservice.config;

import com.meet.billingservice.interceptor.JwtTokenInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author liudong 2022/6/29
 */
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Bean
    public JwtTokenInterceptor jwtTokenInterceptor() {
        return new JwtTokenInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(jwtTokenInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/login","/kaptcha");
    }
}
